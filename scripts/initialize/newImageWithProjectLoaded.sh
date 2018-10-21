#!/usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
if [ ! -d $SCRIPT_PATH ]; then
    echo "Could not determine absolute dir of $0"
    echo "Maybe accessed with symlink"
fi

BASE_DIR="$SCRIPT_PATH/../.."

source "$BASE_DIR/scripts/config.inc"
source "$SCRIPTS_DIR/basicFunctions.inc"

"$INIT_SCRIPTS_DIR/newImage.sh"

pushd $IMAGE_DIR

INFO "LOADING PROJECT INTO IMAGE"
SCRIPTS=""
for var in "$@"
do
    SCRIPTS+="$var "
done
SCRIPTS +="$ST_IMAGE_INIT_SCRIPTS_DIR/saveImage.st"

./pharo Pharo.image $SCRIPTS

rm Pharo.image
rm Pharo.changes
popd