#!/usr/bin/env bash

set -e

SCRIPT_PATH=`dirname $0`;
source $SCRIPT_PATH/basicFunctions.inc

IMAGE_DIR="$SCRIPT_PATH/../image"

bash checkoutVMMaker.sh
bash newImage.sh "loadSqueakNOSVM.st
bash newImage.sh "loadSqueakNOSImage.st"
bash installImage.sh