#!/usr/bin/env bash

SCRIPT_DIR=`dirname $0`

set -e
. $SCRIPT_DIR/envvars.sh

if [ "$1" = "-headless" ]
then
 ARGS="$1"
else
 ARGS=""
fi

$SCRIPT_DIR/updatespur64image.sh "$@"

source $SCRIPT_DIR/get64VMName.sh

echo $VM $BASE64.image $SCRIPT_DIR/BuildSqueakSpurTrunkVMMakerImage.st
$VM $ARGS $BASE64.image $SCRIPT_DIR/BuildSqueakSpurTrunkVMMakerImage.st

