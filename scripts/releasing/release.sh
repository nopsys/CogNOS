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

TAG=`git describe --tags --exact-match 2>/dev/null || echo "false"`
if [ $TAG = "false" ] ; then
    RELEASE=`git log --pretty=format:'%h' -n 1`
else
    RELEASE=$TAG
fi

if [ -d $RELEASE_DIR ]
then
  rm -Rf $RELEASE_DIR
fi

mkdir -p $BUNDLES_DIR

pushd $RELEASE_DIR

if [[ -z "$VERSION"  ||  "$VERSION" == "HD" ]]
then
  cp "$BUILD_DIR/nopsys.vmdk" "$BUNDLES_DIR"
  cp "$BUILD_DIR//vmware.hd.vmx" "$BUNDLES_DIR"
  VBOX_FILENAME="nopsys.vmdk"
else
  cp "$BUILD_DIR/nopsys.iso" "$BUNDLES_DIR"
  #cp ../../../nopsys/build/vmware.cd.vmx $BUNDLES_DIR/
  VBOX_FILENAME="nopsys.iso"
fi

cp "$RELEASE_SCRIPTS_DIR/run.sh" .
sed -i.bak "s/RELEASE=release/RELEASE=$RELEASE/g" run.sh
sed -i.bak "s/VBOX_FILENAME/$BUNDLES_DIR\/$VBOX_FILENAME/g" run.sh
rm run.sh.bak

mkdir "scripts"
pushd "scripts"
cp "$NOPSYS_SCRIPTS_DIR/virtualbox.sh" .
sed -i.bak 's/build\/nopsys.iso/nopsys.iso/' virtualbox.sh 
rm virtualbox.sh.bak
popd 
popd 

tar -zcvf "$SCRIPT_PATH/CogNOS-$RELEASE-$VERSION.tar.gz" "$RELEASE_DIR"
rm -Rf "$RELEASE_DIR"

