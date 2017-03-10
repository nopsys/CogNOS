#!/usr/bin/env bash

set -e

SCRIPT_PATH=`dirname $0`;
source $SCRIPT_PATH/basicFunctions.inc

REPO_NAME="VMMaker"
REPO_PATH="$SCRIPT_PATH/../$REPO_NAME"
REPO_URL="https://github.com/pharo-project/pharo-vm.git"

if [ ! -d $REPO_PATH ]
  then
    INFO Creating git repository with VMMaker sources gathered from $REPO_PATH 
    mkdir $REPO_PATH
    pushd $REPO_PATH
    git init
    git config core.sparseCheckout true
    git remote add -f origin $REPO_URL
    echo "mc/*" > .git/info/sparse-checkout
    popd > /dev/null
fi

pushd $REPO_PATH
git pull --depth=1 origin master
popd > /dev/null