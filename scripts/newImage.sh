#!/usr/bin/env bash

#Based on the same file from pharo-vm project

set -e

SCRIPT_PATH=`dirname $0`;
source $SCRIPT_PATH/basicFunctions.inc

IMAGE_DIR="$SCRIPT_PATH/../image"

if [ ! -d $IMAGE_DIR ]
  then
  mkdir $IMAGE_DIR
fi

# Detect cygwin
# This hack is made to make sure the image can be executed (otherwise image knows is windows
# and threats PATH as win style... and well, it does not finds anything)
OS="`uname -s | cut -b 1-6`"
if [ $OS == "CYGWIN" ]; then
	SCRIPT_PATH="."
fi

# PREPARE VM MAKER IMAGE ===================================================
pushd $IMAGE_DIR > /dev/null

INFO Downloading Stable Pharo image and VM from get.pharo.org
get_web_getter
$GET get.pharo.org/50+vm
bash 50+vm

INFO "LOADING VM MAKER SOURCES INTO IMAGE"
set -x
./pharo Pharo.image "$IMAGE_DIR/../scripts/LoadSqueakNOS.st" "$IMAGE_DIR/../scripts/LoadVMMaker.st"

popd > /dev/null