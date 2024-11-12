#!/bin/env bash

echo "Building smithy projections..."
smithy clean
smithy build

echo "Updating typescript client files..."
rm -rfd ./client/generated/*
rsync -a ./build/smithy/source/typescript-client-codegen/ ./client/generated/ \
    --exclude "package.json" \
    --exclude "README.md"

cd ./client && rm -f ./README.md && ln -s ../README.md ./README.md && cd - 

echo "Done!"
