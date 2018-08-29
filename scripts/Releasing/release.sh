#!/usr/bin/env bash
set -e
SCRIPT_PATH=`dirname $0`
BUNDLES_DIR="bundles"
SCRIPTS_DIR="scripts"

TAG=`git describe --tags --exact-match 2>/dev/null || echo "false"`
if [ $TAG = "false" ] ; then
    RELEASE=`git log --pretty=format:'%h' -n 1`
else
    RELEASE=$TAG
fi

pushd $SCRIPT_PATH
RELEASE_DIR="CogNOS" 
if [ -d $RELEASE_DIR ]
then
  rm -Rf $RELEASE_DIR
fi

mkdir $RELEASE_DIR
pushd $RELEASE_DIR

#version=${VERSION,,}

mkdir $BUNDLES_DIR
if [[ -z "$VERSION"  ||  "$VERSION" == "HD" ]]
then
  echo `pwd`
  cp ../../../nopsys/build/nopsys.vmdk $BUNDLES_DIR/
  cp ../../../nopsys/build/vmware.hd.vmx $BUNDLES_DIR/
  VBOX_FILENAME="nopsys.vmdk"
else
  cp ../../../nopsys/build/nopsys.iso $BUNDLES_DIR/
  #cp ../../../nopsys/build/vmware.cd.vmx $BUNDLES_DIR/
  VBOX_FILENAME="nopsys.iso"
fi

cp ../run.sh .
sed -i.bak "s/RELEASE=release/RELEASE=$RELEASE/g" run.sh
sed -i.bak "s/VBOX_FILENAME/$BUNDLES_DIR\/$VBOX_FILENAME/g" run.sh
rm run.sh.bak

mkdir $SCRIPTS_DIR
pushd $SCRIPTS_DIR
cp ../../../../nopsys/scripts/virtualbox.sh .
sed -i.bak 's/build\/nopsys.iso/nopsys.iso/' virtualbox.sh 
rm virtualbox.sh.bak
popd > /dev/null
popd > /dev/null

tar -zcvf CogNOS-$RELEASE-$VERSION.tar.gz $RELEASE_DIR

rm -Rf $RELEASE_DIR

popd > /dev/null
