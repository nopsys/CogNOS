#!/usr/bin/env bash

source `dirname $0`/basicFunctions.inc

./newImage.sh

IMAGE_DIR="../image"
cd $IMAGE_DIR

INFO "LOADING PROJECT INTO IMAGE"
SCRIPTS=""
for var in "$@"
do
    SCRIPTS+="../scripts/$var "
done

./pharo Pharo.image $SCRIPTS

rm Pharo.image
rm Pharo.changes


