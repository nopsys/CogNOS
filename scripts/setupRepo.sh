#!/usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
if [ ! -d $SCRIPT_PATH ]; then
    echo "Could not determine absolute dir of $0"
    echo "Maybe accessed with symlink"
fi

source $SCRIPT_PATH/basicFunctions.inc

BASE_DIR="$SCRIPT_PATH/.."
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

if [[ "$@" == "-includeUnix" ]]
then
    # CogNOS is a submoudle. TODO: Find the first .git parent directory
    GIT_OPENST="$BASE_DIR/../.git/modules/CogNOS/modules/opensmalltalk-vm/info/sparse-checkout"
else
    GIT_OPENST="$BASE_DIR/.git/modules/opensmalltalk-vm/info/sparse-checkout"
fi

INFO "Configuring Sparse checkout for the open-smalltalk submodule"
cat > "$GIT_OPENST" << EOF
spur64src
spurstack64src
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


if [[ "$@" == "-includeUnix" ]]
then
    cat >> "$GIT_OPENST" << EOF
platforms/unix
build.linux64x64/squeak.cog.spur
build.linux64x64/squeak.stack.spur
build.linux64x64/pharo.cog.spur
build.linux64x64/third-party
build.linux64x64/editpharoinstall.sh
EOF
fi

pushd $BASE_DIR/opensmalltalk-vm/
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
	if [[ "$@" == "-headless" ]]
    then
        ARGS="-headless"
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
    bash $SCRIPT_PATH/newImageWithProjectLoaded.sh "Smalltalk/updateIceberg.st" "Smalltalk/loadSqueakNOSImage.st"
    OK "done"
fi

