#!/usr/bin/env bash
set -e

COSMOS_PROTO_VERSION=v1.0.0-beta.3
COSMOS_PROTOBUF_VERSION=v1.4.11
COSMOS_SDK_VERSION=v0.46.15
IBC_GO_VERSION=v6.2.0
ICS23_VERSION=v0.7.1

CWD=$(pwd)
mkdir -p $CWD/proto
mkdir -p $CWD/third_party
cp -r $CWD/proto $CWD/proto.bak
cp -r $CWD/third_party $CWD/third_party.bak
rm -rf $CWD/proto
rm -rf $CWD/third_party

git_clone_folders() {
    REPO_URL=$1
    CHECKOUT=$2
    shift 2

    echo "Cloning $REPO_URL#$CHECKOUT ..."

    TEMP_DIR=$(mktemp -d)
    git clone $REPO_URL $TEMP_DIR
    cd $TEMP_DIR
    git checkout $CHECKOUT
    while [[ $# -ge 2 ]]; do
        SRC_DIR=$1
        DST_DIR=$2
        shift 2

        echo "Copying $TEMP_DIR/$SRC_DIR to $CWD/$DST_DIR ..."
        mkdir -p $CWD/$DST_DIR
        cp -r $TEMP_DIR/$SRC_DIR/* $CWD/$DST_DIR/
    done
    cd $CWD
    rm -rf $TEMP_DIR

    echo
}

git_clone_files() {
    REPO_URL=$1
    CHECKOUT=$2
    shift 2

    echo "Cloning $REPO_URL#$CHECKOUT ..."

    TEMP_DIR=$(mktemp -d)
    git clone $REPO_URL $TEMP_DIR
    cd $TEMP_DIR
    git checkout $CHECKOUT
    while [[ $# -ge 2 ]]; do
        SRC_FILE_PATH=$1
        DST_FILE_PATH=$2
        shift 2

        echo "Copying $TEMP_DIR/$SRC_FILE_PATH to $CWD/$DST_FILE_PATH ..."
        mkdir -p $CWD/$(dirname $DST_FILE_PATH)
        cp -r $TEMP_DIR/$SRC_FILE_PATH $CWD/$DST_FILE_PATH
    done
    cd $CWD
    rm -rf $TEMP_DIR

    echo
}

git_clone_folders https://github.com/cosmos/cosmos-proto $COSMOS_PROTO_VERSION proto/cosmos_proto third_party/cosmos_proto
git_clone_folders https://github.com/cosmos/gogoproto $COSMOS_PROTOBUF_VERSION gogoproto third_party/gogoproto
git_clone_folders https://github.com/googleapis/googleapis master google third_party/google
git_clone_folders https://github.com/cosmos/cosmos-sdk $COSMOS_SDK_VERSION \
    proto/cosmos proto/cosmos \
    proto/tendermint proto/tendermint
git_clone_folders https://github.com/cosmos/ibc-go $IBC_GO_VERSION proto/ibc proto/ibc
git_clone_files https://github.com/cosmos/ibc-go $IBC_GO_VERSION third_party/proto/proofs.proto third_party/proofs.proto

rm -rf $CWD/third_party.bak
rm -rf $CWD/proto.bak