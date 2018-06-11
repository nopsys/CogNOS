#!/usr/bin/env bash

source `dirname $0`/basicFunctions.inc

BASE_DIR=".."
IMAGE_DIR="$BASE_DIR/image"
THIRD_PARTY_DIR="$BASE_DIR/opensmalltalk-vm/third-party/"
OPENLIBM_DIR="$THIRD_PARTY_DIR/openlibm"
VM_DEV_DIR="$BASE_DIR/opensmalltalk-vm/image"
VM_DEV_IMAGE_NAME="BuildCogNOS"
IMAGE_NAME="SqueakNOS"

INFO "Initializing submodules"
pushd $BASE_DIR
    load_submodule
popd > /dev/null
pushd $BASE_DIR/opensmalltalk-vm/
    ./scripts/updateSCCSVersions
popd > /dev/null
OK "Submodules initialized"

INFO "Configuring Sparse checkout for the open-smalltalk submodule"
cat > "$BASE_DIR/.git/modules/opensmalltalk-vm/info/sparse-checkout" << EOF
spur64src
scripts/updateSCCSVersions
scripts/versionInfoPlist
platforms/nopsys
platforms/Cross
third-party/*.spec
image/envvars.sh
image/CogNOS Generation Workspace.text
image/BuildSqueakSpurTrunkVMMakerImage.st
image/buildspurtrunkvmmaker64image.sh
image/updatespur64image.sh
image/getGoodSpur64VM.sh
image/get64VMName.sh
image/getlatesttrunk64image.sh
image/NukePreferenceWizardMorph.st
image/UpdateSqueakTrunkImage.st
EOF

pushd $BASE_DIR/opensmalltalk-vm/
    git config core.sparsecheckout true
    git read-tree -mu HEAD
popd > /dev/null
OK "Sparse checkout configured"

INFO "Configuring Sparse checkout for the are-we-fast benchmarks submodule"
cat > "$BASE_DIR/.git/modules/are-we-fast-yet/info/sparse-checkout" << EOF
benchmarks/Smalltalk/*
EOF

pushd $BASE_DIR/are-we-fast-yet/
    git config core.sparsecheckout true
    git read-tree -mu HEAD
popd > /dev/null
OK "Sparse checkout configured"

INFO "Checking whether a compilation config exists (and creating a default one if not)"
if [ ! -f $BASE_DIR/nopsys/compilation.conf ]
then
    cp -n $BASE_DIR/nopsys/compilation.conf.example $BASE_DIR/nopsys/compilation.conf
fi

INFO "Checking for openlibm"
if [ ! -d "$OPENLIBM_DIR" ]
then
    pushd $THIRD_PARTY_DIR
    # We should probably checkout a release version
    INFO "Checking out last version of openlibm"
    git clone https://github.com/nopsys/openlibm.git openlibm
    popd > /dev/null
    OK "Openlibm ok"
fi

if [ ! -f "$VM_DEV_DIR/$VM_DEV_IMAGE_NAME.image" ]
then
    pushd $VM_DEV_DIR
    INFO "Downloading Squeak image with VMMaker for VM-level development... "
	if [ "$1" = "-headless" ]
    then
        ARGS="$1"
    else
        ARGS=""
    fi
    bash buildspurtrunkvmmaker64image.sh $ARGS 
    OK "done"
    popd > /dev/null
fi

if [ ! -f "$IMAGE_DIR/$IMAGE_NAME.image" ]
then
    INFO "Downloading Pharo image with SqueakNOS code for image-level development..."
    bash newImageWithProjectLoaded.sh "Smalltalk/updateIceberg.st" "Smalltalk/loadSqueakNOSImage.st"
    OK "done"
fi

