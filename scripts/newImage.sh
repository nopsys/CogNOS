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

pushd $IMAGE_DIR > /dev/null

get_web_getter
if [ ! -f Pharo.image ]
  then
  INFO Downloading Stable Pharo image from get.pharo.org
  $GET get.pharo.org/50
  bash 50
fi
if [ ! -f pharo ]
  then
  INFO Downloading Stable Pharo VM from get.pharo.org
  $GET get.pharo.org/vm50
  bash vm50
fi

popd > /dev/null
