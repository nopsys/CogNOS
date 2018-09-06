#!/usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
if [ ! -d $SCRIPT_PATH ]; then
    echo "Could not determine absolute dir of $0"
    echo "Maybe accessed with symlink"
fi

source $SCRIPT_PATH/basicFunctions.inc


INFO "Initializing submodules"
pushd $BASE_DIR
    load_all_submodules
popd > /dev/null
pushd $BASE_DIR/opensmalltalk-vm/
    ./scripts/updateSCCSVersions
popd > /dev/null
OK "Submodules initialized"

pushd $BASE_DIR
	$SCRIPT_PATH/checkoutOpenSmalltalk.sh
popd > /dev/null

INFO "Checking whether a compilation config exists (and creating a default one if not)"
if [ ! -f $BASE_DIR/nopsys/compilation.conf ]
then
    cp -n $BASE_DIR/nopsys/compilation.conf.example $BASE_DIR/nopsys/compilation.conf
fi

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

INFO "Checking for latest Squeak image with VMMaker for VM-level development... "
pushd $VM_DEV_DIR
if [[ "$@" == "-headless" ]]
then
    ARGS="-headless"
else
    ARGS=""
fi
bash $SCRIPT_PATH/opensmalltalk/buildspurtrunkvmmaker64image.sh $ARGS 
OK "done"
popd > /dev/null

if [ ! -f "$IMAGE_DIR/$IMAGE_NAME.image" ]
then
    INFO "Downloading Pharo image with SqueakNOS code for image-level development..."
    bash $SCRIPT_PATH/newImageWithProjectLoaded.sh "Smalltalk/updateIceberg.st" "Smalltalk/loadSqueakNOSImage.st"
    OK "done"
fi

