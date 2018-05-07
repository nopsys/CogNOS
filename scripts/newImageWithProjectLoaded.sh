#!/usr/bin/env bash

source `dirname $0`/basicFunctions.inc

./newImage.sh

IMAGE_DIR="../image"
cd $IMAGE_DIR

INFO "LOADING PROJECT INTO IMAGE"
set -x
SCRIPTS=""
for var in "$@"
do
    SCRIPTS+="../scripts/$var "
done

./pharo-ui Pharo.image $SCRIPTS

rm Pharo.image
rm Pharo.changes


