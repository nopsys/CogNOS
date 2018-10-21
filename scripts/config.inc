#!/usr/bin/env bash

## Base Directories 
OPEN_ST_VM_DIR="$BASE_DIR/opensmalltalk-vm"
IMAGE_DIR="$BASE_DIR/image"
NOPSYS_DIR="$BASE_DIR/nopsys"
SCRIPTS_DIR="$BASE_DIR/scripts"

## Artifact Directories
THIRD_PARTY_DIR="$OPEN_ST_VM_DIR/third-party"
OPENLIBM_DIR="$THIRD_PARTY_DIR/openlibm"
BUILD_SCRIPTS_DIR="$SCRIPTS_DIR/buildScripts"
INIT_SCRIPTS_DIR="$SCRIPTS_DIR/initialize"
ST_IMAGE_INIT_SCRIPTS_DIR="$SCRIPTS_DIR/smalltalk"
RELEASE_SCRIPTS_DIR="$SCRIPTS_DIR/releasing"

## Constants
COGNOS_IMAGE_NAME="CogNos.image"
VM_DEV_IMAGE_NAME="BuildCogNos.image"

## OPENLIBM
OPEN_LIB_REPO_URL="https://github.com/nopsys/openlibm.git"
OPEN_LIB_BRANCH="master"
OPEN_LIB_DIR_NAME="openlibm"

##  OpenSmalltalk
NOPSYS_PLATFORM_DIR="$OPEN_ST_VM_DIR/platforms/nopsys"
VM_DEV_DIR="$OPEN_ST_VM_DIR/image"

# Releasing
RELEASE_DIR="$BASE_DIR/release" 
BUNDLES_DIR="$RELEASE_DIR/bundles" 
BUNDLES_DIR_TO_RELEASE="bundles"
BUILD_DIR="$NOPSYS_DIR/build"
NOPSYS_SCRIPTS_DIR="$NOPSYS_DIR/scripts"