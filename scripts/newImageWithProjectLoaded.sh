#!/usr/bin/env bash
set -e

SCRIPT_PATH=`dirname $0`;
source $SCRIPT_PATH/basicFunctions.inc

IMAGE_DIR="$SCRIPT_PATH/../image"

if [ ! -d $IMAGE_DIR ]
  then
  ./newImage.sh
fi


pushd $IMAGE_DIR > /dev/null


if [ ! -f $IMAGE_DIR/Pharo.image ]
  then
  pushd $SCRIPT_PATH
  ./newImage.sh
  popd > /dev/null
fi

INFO "LOADING VM MAKER SOURCES INTO IMAGE"
set -x
./pharo Pharo.image "$IMAGE_DIR/../scripts/$1"

rm Pharo.image
rm Pharo.changes

popd > /dev/null
