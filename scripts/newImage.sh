#!/usr/bin/env bash

#Based on the same file from pharo-vm project

source `dirname $0`/basicFunctions.inc

#Threaded Heartbeat VMs do not work on OSX 
VM="vm61"
IMAGE_DIR="../image"

mkdir -p $IMAGE_DIR
cd $IMAGE_DIR

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


