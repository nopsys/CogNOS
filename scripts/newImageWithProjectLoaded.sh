#!/usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
if [ ! -d $SCRIPT_PATH ]; then
    echo "Could not determine absolute dir of $0"
    echo "Maybe accessed with symlink"
fi

source $SCRIPT_PATH/basicFunctions.inc

$SCRIPT_PATH/newImage.sh

IMAGE_DIR="$SCRIPT_PATH/../image"
pushd $IMAGE_DIR

INFO "LOADING PROJECT INTO IMAGE"
SCRIPTS=""
for var in "$@"
do
    SCRIPTS+="../scripts/$var "
done

./pharo Pharo.image $SCRIPTS

rm Pharo.image
rm Pharo.changes
popd > /dev/null