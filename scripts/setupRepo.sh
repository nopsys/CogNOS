#!/usr/bin/env bash

set -e

SCRIPT_PATH=`dirname $0`;
source $SCRIPT_PATH/basicFunctions.inc

IMAGE_DIR="$SCRIPT_PATH/../image"
BASE_DIR="$SCRIPT_PATH/.."
THIRD_PARTY_DIR="$BASE_DIR/opensmalltalk-vm/third-party/"
OPENLIBM_DIR="$THIRD_PARTY_DIR/openlibm"

INFO "Initializing submodules"
pushd $BASE_DIR
    load_submodule
popd > /dev/null
OK "Submodules initialized"

INFO "Checking for openlibm"
if [ ! -d "$OPENLIBM_DIR" ]
then
    pushd $THIRD_PARTY_DIR
    # We should probably checkout a release version
    INFO "Checking out last version of openlibm"
    git clone https://github.com/nopsys/openlibm.git openlibm
    popd > /dev/null
    OK "Openlibm ok"
fi


pushd $SCRIPT_PATH
    INFO "Downloading Pharo image with VMMaker"
    bash checkoutVMMaker.sh
    OK "Pharo image downloaed"
    bash newImageWithProjectLoaded.sh "loadSqueakNOSVM.st"
    bash newImageWithProjectLoaded.sh "loadSqueakNOSImage.st"
    bash installImage.sh
popd > /dev/null    