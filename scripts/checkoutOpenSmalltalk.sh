SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
if [ ! -d $SCRIPT_PATH ]; then
    echo "Could not determine absolute dir of $0"
    echo "Maybe accessed with symlink"
fi

source $SCRIPT_PATH/basicFunctions.inc

INFO "Checking out latest version of opensmalltalk-vm repo"

if [ ! -d "opensmalltalk-vm" ]
then
	INFO "opensmalltalk-vm directory doesn't exist"
	INFO "Doing a manual checkout to avoid downloading lots of useless stuff"
	mkdir opensmalltalk-vm
	cd opensmalltalk-vm
	git init
	git config core.sparseCheckout true
	GIT_SPARSE=.git/modules/CogNOS/modules/opensmalltalk-vm/info/sparse-checkout
else
	cd opensmalltalk-vm
fi

INFO "Configuring Sparse checkout for the open-smalltalk submodule"
cat > "$GIT_SPARSE" << EOF
spur64src
spurstack64src
scripts/updateSCCSVersions
scripts/versionInfoPlist
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

if [[ "$OSTYPE" == "darwin"* ]]; then
	INFO "running on mac, skipping linux stuff from checkout"
else
    cat >> "$GIT_SPARSE" << EOF
platforms/unix
build.linux64x64/squeak.cog.spur
build.linux64x64/squeak.stack.spur
build.linux64x64/pharo.cog.spur
build.linux64x64/third-party
build.linux64x64/editpharoinstall.sh
EOF
fi

git remote add origin git@github.com:OpenSmalltalk/opensmalltalk-vm.git
git fetch --depth 1 origin Cog
git checkout Cog

OK "Sparse checkout configured"

INFO "Now checking out latest version of nopsys platform"
if [ -d "platforms/nopsys" ]
then
	INFO "nopsys platform exists! pulling latest version"
	cd platforms/nopsys
	git pull origin master
else
	INFO "nopsys platform doesn't exist, cloning it"
	git checkout git@github.com:nopsys/nopsysCog.git opensmalltalk-vm/platforms/nopsys
fi



