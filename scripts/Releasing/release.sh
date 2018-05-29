#!/usr/bin/env bash
set -e

RELEASE_DIR="CogNOS" 
if [ -d $RELEASE_DIR ]
then
  rm -Rf $RELEASE_DIR
fi

mkdir $RELEASE_DIR
pushd $RELEASE_DIR

cp ../run.sh .
cp ../../../nopsys/build/nopsys.iso .
cp ../../../nopsys/scripts/virtualbox.sh .

sed -i.bak 's/build\/nopsys.iso/nopsys.iso/' virtualbox.sh 
rm virtualbox.sh.bak

popd > /dev/null

tar -zcvf CogNOS.tar.gz $RELEASE_DIR

rm -Rf $RELEASE_DIR
