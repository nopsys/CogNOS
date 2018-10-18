#!/usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
if [ ! -d $SCRIPT_PATH ]; then
    echo "Could not determine absolute dir of $0"
    echo "Maybe accessed with symlink"
fi

BASE_DIR="$SCRIPT_PATH/../.."

source "$BASE_DIR/scripts/config.inc"
source "$SCRIPTS_DIR/basicFunctions.inc"

pushd $OPEN_ST_VM_DIR
    
./scripts/updateSCCSVersions

INFO "Configuring Sparse checkout for the open-smalltalk submodule"
if [[ "$@" == "-includeUnix" ]]
then
    # CogNOS is a submoudle. TODO: Find the first .git parent directory
    GIT_OPENST="$BASE_DIR/../.git/modules/CogNOS/modules/opensmalltalk-vm/info/sparse-checkout"
else
    GIT_OPENST="$BASE_DIR/.git/modules/opensmalltalk-vm/info/sparse-checkout"
fi

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

    git config core.sparsecheckout true
    git read-tree -mu HEAD
popd > /dev/null
OK "Sparse checkout configured"