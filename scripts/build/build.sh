#!/usr/bin/env bash
set -e

SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
if [ ! -d $SCRIPT_PATH ]; then
    echo "Could not determine absolute dir of $0"
    echo "Maybe accessed with symlink"
fi

BASE_DIR="$SCRIPT_PATH/../.."

source "$BASE_DIR/scripts/config.inc"
source "$SCRIPTS_DIR/basicFunctions.inc"

$SCRIPT_PATH/buildSources.sh $@

pushd $NOPSYS_PLATFORM_DIR
    make clean
    if [[ -z "$VERSION"  ||  "$VERSION" == "HD" ]]
    then
        make -C "$NOPSYS_DIR" build/vmware.hd.vmx
        make hd
    else
        make -C "$NOPSYS_DIR" build/vmware.cd.vmx
        make iso
    fi
popd

