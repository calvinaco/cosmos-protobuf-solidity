#!/usr/bin/env bash
# Copyright 2021 Datachain, Inc (licensed under the Apache License, Version 2.0)
# Modifications Copyright (c) 2023-present Calvin Lau (licensed under the Apache License, Version 2.0)
set -e

if [ -z "$SOLPB_DIR" ]; then
    echo "variable SOLPB_DIR must be set"
    exit 1
fi

CWD=$(pwd)
GEN_DIR="$CWD/generated"
cp -r $CWD/generated $CWD/generated.bak
rm -rf $GEN_DIR
mkdir -p "$GEN_DIR"

function replace_reserved_proto_field() {
    FIELD_NAME=$1
    FILE=$2
    
    TEMP_FILE=$(mktemp)
    sed -E "s#[[:space:]]$FIELD_NAME[[:space:]]+=[[:space:]]+([0-9]+)(.*);# f_$FIELD_NAME = \1\2;#g" $FILE > $TEMP_FILE
    mv $TEMP_FILE $FILE
}

PROTO_WORKDIR=$(mktemp -d)
cp -r $CWD/proto/* $PROTO_WORKDIR/

for file in $(find $PROTO_WORKDIR -name '*.proto')
do
    replace_reserved_proto_field "type" $file
    replace_reserved_proto_field "address" $file
    replace_reserved_proto_field "int" $file
    replace_reserved_proto_field "dec" $file
    replace_reserved_proto_field "bytes" $file
    # TODO: format the proto file after sed replacement
    echo "Generating $file"
    protoc -I$PROTO_WORKDIR -I "third_party" -I${SOLPB_DIR}/protobuf-solidity/src/protoc/include \
        --plugin=protoc-gen-sol=${SOLPB_DIR}/protobuf-solidity/src/protoc/plugin/gen_sol.py \
        --"sol_out=gen_runtime=ProtoBufRuntime.sol&solc_version=0.8.9&ignore_protos=gogoproto/gogo.proto:$GEN_DIR" \
        $file
done
rm -rf $PROTO_WORKDIR

# Create an empty cosmos/msg/v1/msg.sol to avoid breaking imports
# /cosmos/msg/v1/msg.proto contains only `extend google.protobuf.MessageOptions` which is not
# converted to .sol file by protobuf-solidity plugin. To avoid breaking the import an empty file
# has to be created.
mkdir -p "$GEN_DIR/cosmos/msg/v1"
echo "// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.9;" >> "$GEN_DIR/cosmos/msg/v1/msg.sol"

function sanitize_solidity_library_name() {
    LIBRARY_PREFIX=$1
    FILE=$2

    TEMP_FILE=$(mktemp)
    sed "s#$LIBRARY_PREFIX#${LIBRARY_PREFIX//\//_}#g" $FILE > $TEMP_FILE
    mv $TEMP_FILE $FILE  
}
function patch_missing_google_imports() {
    LIBRARY_NAME=$1
    IMPORT_FILE_NAME=$2
    FILE=$3

    LIBRARY_IS_USED=$(grep -o $1 $FILE | wc -l)
    if [[ $LIBRARY_IS_USED -ge 1 ]]; then
        IMPORT_LINE=$(sed '3q;d' $FILE | sed s#ProtoBufRuntime.sol#$IMPORT_FILE_NAME#g)
        ed $FILE > /dev/null << EOF
4i
$IMPORT_LINE
.
w
EOF
    fi
}

for file in $(find ./generated -name '*.sol')
do
    sanitize_solidity_library_name "COSMOS/STAKING/V1BETA1/" $file
    sanitize_solidity_library_name "COSMOS/GOV/V1/" $file
    sanitize_solidity_library_name "COSMOS/GOV/V1BETA1/" $file
    sanitize_solidity_library_name "COSMOS/ORM/V1/" $file
    sanitize_solidity_library_name "COSMOS/TX/V1BETA1/" $file
    sanitize_solidity_library_name "COSMOS/TX/SIGNING/V1BETA1/" $file
    sanitize_solidity_library_name "TENDERMINT/ABCI/" $file
    sanitize_solidity_library_name "TENDERMINT/TYPES/" $file
    sanitize_solidity_library_name "COSMOS_PROTO/" $file

    patch_missing_google_imports "GoogleProtobufDuration" "GoogleProtobufDuration.sol" $file
    patch_missing_google_imports "GoogleProtobufTimestamp" "GoogleProtobufTimestamp.sol" $file
done

# Copy pre-built google.protobuf.* files which is ignored by protobuf-solidity plugin by default
mkdir -p $GEN_DIR/google/protobuf
cp ./prebuilts/google/protobuf/*.sol $GEN_DIR/google/protobuf
cp ./prebuilts/GoogleProtobufDuration.sol $GEN_DIR/
cp ./prebuilts/GoogleProtobufTimestamp.sol $GEN_DIR/

rm -rf $CWD/generated.bak
