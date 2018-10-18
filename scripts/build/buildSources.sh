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

pushd $VM_DEV_DIR
    source get64VMName.sh
    INFO "Generating Both Interpreter and JIT Sources"
    $VM -headless $VM_DEV_IMAGE_NAME "$ST_IMAGE_INIT_SCRIPTS_DIR/Smalltalk/buildInterpreterSources.st"
    $VM -headless $VM_DEV_IMAGE_NAME "ST_IMAGE_INIT_SCRIPTS_DIR/buildJitSources.st"
    OK "done"
popd

