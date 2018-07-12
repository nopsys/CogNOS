#!/usr/bin/env bash
set -e
source `dirname $0`/basicFunctions.inc

BASE_DIR=".."
NOPSYS_DIR="$BASE_DIR/opensmalltalk-vm/platforms/nopsys"

./buildSources.sh $@


pushd $NOPSYS_DIR
make clean
if [[ -z $VERSION | $VERSION == "HD" ]]
then
    make hd
else
    make iso
fi
popd > /dev/null

