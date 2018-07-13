#!/usr/bin/env bash
set -e

SCRIPT_PATH=`dirname $0`

pushd $SCRIPT_PATH

RELEASE_DIR="CogNOS" 
if [ -d $RELEASE_DIR ]
then
  rm -Rf $RELEASE_DIR
fi

mkdir $RELEASE_DIR
pushd $RELEASE_DIR

version=${VERSION,,}

cp ../run-$version.sh .
if [[ -z "$VERSION"  ||  "$VERSION" == "HD" ]]
then
  cp ../../../nopsys/build/nopsys.vmdk .
  cp ../../../nopsys/build/vmware.hd.vmx .

else
  cp ../../../nopsys/build/nopsys.iso .
  cp ../../../nopsys/build/vmware.cd.vmx .
fi

cp ../../../nopsys/scripts/virtualbox.sh .

sed -i.bak 's/build\/nopsys.iso/nopsys.iso/' virtualbox.sh 
rm virtualbox.sh.bak

popd > /dev/null

tar -zcvf CogNOS-$VERSION.tar.gz $RELEASE_DIR

rm -Rf $RELEASE_DIR

popd > /dev/null
