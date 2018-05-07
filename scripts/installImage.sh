#!/usr/bin/env bash

source `dirname $0`/basicFunctions.inc

IMAGE_DIR="../image"
IMAGE_DST_DIR="../nopsys/build/extra"

FILENAME="SqueakNOS"

mkdir -p $IMAGE_DST_DIR

cp "$IMAGE_DIR/$FILENAME.image" "$IMAGE_DST_DIR/$FILENAME.image"
cp "$IMAGE_DIR/$FILENAME.changes" "$IMAGE_DST_DIR/$FILENAME.changes"
