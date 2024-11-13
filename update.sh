#!/bin/env bash

set -xeo pipefail

# Build smithy projections
smithy clean
smithy build

# Update typescript client files
rm -rfd ./client/generated/*
rsync -a ./build/smithy/source/typescript-client-codegen/ ./client/generated/ \
    --exclude "package.json" \
    --exclude "README.md" \
    --exclude ".*" \
    --exclude ".*/"

if [[ $1 =~ "publish" ]]; then 
    cd ./client/
    npm publish
    cd -
fi
