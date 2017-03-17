#!/usr/bin/env bash

set -e

SCRIPT_PATH=`dirname $0`;
source $SCRIPT_PATH/basicFunctions.inc

IMAGE_DIR="$SCRIPT_PATH/../image"
IMAGE_DST_DIR="$SCRIPT_PATH/../opensmalltalk-vm/build.nopsys32x86/image"

FILENAME="SqueakNOS"

if [ ! -d $IMAGE_DST_DIR ]
  then
  mkdir $IMAGE_DST_DIR
fi

mv "$IMAGE_DIR/$FILENAME.image" "$IMAGE_DST_DIR/$FILENAME.image"
mv "$IMAGE_DIR/$FILENAME.changes" "$IMAGE_DST_DIR/$FILENAME.changes"
