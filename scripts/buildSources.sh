#!/usr/bin/env bash
set -e
source `dirname $0`/basicFunctions.inc

BASE_DIR=".."
VM_DEV_DIR="$BASE_DIR/opensmalltalk-vm/image"

pushd $VM_DEV_DIR
source get64VMName.sh

if [ ! -z "$JIT" ]
then
    
    INFO "Generating JIT Sources"
    $VM -headless $BASE64.image ../../scripts/Smalltalk/buildJitSources.st
else  
    INFO "Generating Interpreter Sources"
    $VM -headless $BASE64.image ../../scripts/Smalltalk/buildInterpreterSources.st
fi

OK "done"
popd > /dev/null

