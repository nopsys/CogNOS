#!/usr/bin/env bash
set -e

SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
if [ ! -d $SCRIPT_PATH ]; then
    echo "Could not determine absolute dir of $0"
    echo "Maybe accessed with symlink"
fi

source $SCRIPT_PATH/basicFunctions.inc

pushd $VM_DEV_DIR
source get64VMName.sh

INFO "Generating Both Interpreter and JIT Sources"
$VM -headless $BASE64.image ../../scripts/Smalltalk/buildInterpreterSources.st
$VM -headless $BASE64.image ../../scripts/Smalltalk/buildJitSources.st

OK "done"
popd > /dev/null

