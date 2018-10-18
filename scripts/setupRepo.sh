#!/usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
if [ ! -d $SCRIPT_PATH ]; then
    echo "Could not determine absolute dir of $0"
    echo "Maybe accessed with symlink"
fi

BASE_DIR="$SCRIPT_PATH/.."

source "$BASE_DIR/scripts/config.inc"
source "$SCRIPTS_DIR/basicFunctions.inc"

INFO "Initializing submodules"; pushd $BASE_DIR; load_submodule; popd 

INFO "Checking whether a compilation config exists (and creating a default one if not)"
if [ ! -f $BASE_DIR/nopsys/compilation.conf ]
then
    cp -n "$BASE_DIR/nopsys/compilation.conf.example" "$BASE_DIR/nopsys/compilation.conf"
    WARN You should review the compilation configuration file, located at: \
    "$BASE_DIR/nopsys/compilation.conf", to assess that all the required compilations \
    tools exist in your setting and are properly referenced! 
fi

#Install openlibm into opensmalltalk
checkout $THIRD_PARTY_DIR $OPEN_LIB_REPO_URL $OPEN_LIB_BRANCH $OPEN_LIB_DIR_NAME

$INIT_SCRIPTS_DIR/initOpenSmalltalkRepo.sh 
$INIT_SCRIPTS_DIR/createDevImages.sh "$@"

