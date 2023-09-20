#!/usr/bin/env bash
set -e

mkdir plugins
git clone https://github.com/calvinaco/solidity-protobuf
cd solidity-protobuf
git checkout bugfix/v0.1.0/gen-sol-extract-error

pip install -r requirements.txt
