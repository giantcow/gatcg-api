#!/bin/env bash

set -xeo pipefail

# The smithy-generate files still expect the package.json to be in the same folder
# we need to update these files to tell it to look one more directory up
find ./generated/ \
    -type f \
    -iname "*.ts" -or -iname "*.js" \
    -exec sed -i 's/\.\.\/package\.json/\.\.\/\.\.\/package\.json/g' {} \;
