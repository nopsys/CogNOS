#!/usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
if [ ! -d $SCRIPT_PATH ]; then
    echo "Could not determine absolute dir of $0"
    echo "Maybe accessed with symlink"
fi

BASE_DIR="$SCRIPT_PATH/../.."

source "$BASE_DIR/scripts/config.inc"
source "$SCRIPTS_DIR/basicFunctions.inc"

if [ ! -f "$VM_DEV_DIR/$VM_DEV_IMAGE_NAME" ]
then
    pushd $VM_DEV_DIR
    INFO "Downloading Squeak image with VMMaker for VM-level development... "
	if [[ "$@" == "-headless" ]]
    then
        ARGS="-headless"
    else
        ARGS=""
    fi
    bash buildspurtrunkvmmaker64image.sh $ARGS 
    OK "done"
    popd > /dev/null
fi

if [ ! -f "$IMAGE_DIR/$COGNOS_IMAGE_NAME" ]
then
    INFO "Downloading Pharo image with SqueakNOS code"
    bash $INIT_SCRIPTS_DIR/newImageWithProjectLoaded.sh "$ST_IMAGE_INIT_SCRIPTS_DIR/updateIceberg.st" "$ST_IMAGE_INIT_SCRIPTS_DIR/loadSqueakNOSImage.st"
    OK "done"
fi
