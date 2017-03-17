#!/usr/bin/env bash

set -e

SCRIPT_PATH=`dirname $0`;
source $SCRIPT_PATH/basicFunctions.inc

IMAGE_DIR="$SCRIPT_PATH/../image"
BASE_DIR="$SCRIPT_PATH/.."

pushd $BASE_DIR
    git submodule update --init --recursive
popd > /dev/null

pushd $SCRIPT_PATH
    bash checkoutVMMaker.sh
    bash newImageWithProjectLoaded.sh "loadSqueakNOSVM.st"
    bash newImageWithProjectLoaded.sh "loadSqueakNOSImage.st"
    bash installImage.sh
popd > /dev/null    