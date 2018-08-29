#!/usr/bin/env bash
set -e

SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
if [ ! -d $SCRIPT_PATH ]; then
    echo "Could not determine absolute dir of $0"
    echo "Maybe accessed with symlink"
fi


source $SCRIPT_PATH/basicFunctions.inc

BASE_DIR="$SCRIPT_PATH/.."
NOPSYS_DIR="$BASE_DIR/opensmalltalk-vm/platforms/nopsys"

$SCRIPT_PATH/buildSources.sh $@

pushd $NOPSYS_DIR
make clean
if [[ -z "$VERSION"  ||  "$VERSION" == "HD" ]]
then
    make -C ../../../nopsys build/vmware.hd.vmx
    make hd
else
    make -C ../../../nopsys build/vmware.cd.vmx
    make iso
fi
popd > /dev/null

