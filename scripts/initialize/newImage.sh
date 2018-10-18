#!/usr/bin/env bash
set -e 
#Based on the same file from pharo-vm project
SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
if [ ! -d $SCRIPT_PATH ]; then
    echo "Could not determine absolute dir of $0"
    echo "Maybe accessed with symlink"
fi

BASE_DIR="$SCRIPT_PATH/../.."

source "$BASE_DIR/scripts/config.inc"
source "$SCRIPTS_DIR/basicFunctions.inc"

get_web_getter

#Threaded Heartbeat VMs do not work on OSX 
VM="vm61"
mkdir -p "$IMAGE_DIR"

pushd "$IMAGE_DIR"
  if [ ! -f Pharo.image ]
    then
    INFO Downloading Stable Pharo image from get.pharo.org
    $GET get.pharo.org/64/61
    bash 61
  else
    INFO Pharo image already present, skipping download
  fi

  if [ ! -f pharo ]
    then
    INFO Downloading Stable Pharo VM from get.pharo.org
    $GET get.pharo.org/64/$VM
    bash $VM
  else
    INFO "VM for Pharo already present, skipping download"
  fi
popd