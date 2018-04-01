# CogNOS in a nutshell

This repo contains a nopsys-style version of Cog VM. That means a Cog VM that runs a Squeak/Pharo/Cuis image without an OS.
For more information visit  https://github.com/nopsys/nopsys

## Getting started

To work with CogNOS you will need a few artifacts. Instructions on how to get or build each of them are written in the next sections. The list of things we will use is this:

- a compiled `64-bit cog vm` - to be able to run a squeak/pharo/cuis image you need an already working Cog VM.
- a `64-bit spur squeak/pharo/cuis NOS image` - this image will contain the "OS" drivers. 
- the sources of `opensmalltalk-vm` - to run `Cog` within `nopsys` you need the sources of `Cog`
- a `64-bit squeak vmmaker image` - this is needed only to translate SqueakNOS slang plugin to C.
- a `nopsys` repo - will provide the infrastructure to build a basic libnopsys, link it with the Cog VM and generate a bootable ISO image. Also will let us run the ISO image in a system VM like VirtualBox or QEMU.

We haven't done any release yet, so the only way to try CogNOS is to build it yourself, which shall be easy.
One of our goals is that both using and building Nopsys becomes a *push one button* process.
Everything that is needed has already been put in the CogNOS repository.

## Fetching and building artifacts

CogNOS depends on the open-smalltalk VM, which has a very cumbersome building process. 
We would like to work more on improving the whole building process. However, we provide
a bunch of scripts for automatically generating all the needed artifacts. 

#### 1. Checkout the CogNOS repo and submodules:

    git clone https://github.com/nopsys/CogNOS.git
    git submodule update --init --recursive

The CogNOS repo contains the scripts that will download all other artifacts.

#### 2. Setup the repo, both for building and development:

    bash scripts/setupRepo.sh
    
This script will download and configure all the needed smalltalk images and a compiled VM to run them.

#### 3. Install dependencies (for making a bootable iso):

    sudo apt install grub-pc-bin xorriso
    
[Click here](Documentation/buildOSx.md) for dependency instructions in OSx      

#### 4. Build CogNOS:

    cd opensmalltalk-vm/platforms/nopsys
    make  # builds vm.obj
    make iso # builds libnopsys.lib, links it to vm.obj and generates a bootable ISO image

#### 5. Try it

We support _all_ main system vms available: qemu, VirtualBox, 
VMWare and Bochs. You can even run the image with an attached gdb (through qemu)

    make try-qemu    # runs it using qemu
    make try-qemudbg # runs it using qemu attaching a gdb to debug remotely and with symbols!!!
    make try-bochs   # runs it using bochs
    make try-vbox    # runs it using VirtualBox
    make try-vmware  # runs it using WMWare player


Currently I (pocho) suggest using qemu, it is fast, open, easy to install and lightweight. Installs with:

    sudo apt install qemu

# Development instructions

There are two ways of contributing. At the image level or at the VM level.

## Image-level contributions
This is the standard way of contributing. Usually most users will work only at the image level. If all your contributions live at the image side then you could just make a pull request of smalltalk code to the SqueakNOS repository. 

(Setup the corresponding git repo)

## VM-level contributions

Modifications and additions to Cog VM in CogNOS follow the standard Squeak development process: there is a plugin written in Slang (SqueakNOSPlugin) which is used to generate the corresponding C code from an Smalltalk image.   
So, if you are working with some very low-level features, found low-level bugs, or just would like to propose a new primitive you will need to change the Slang code. 

Under the [image](https://github.com/nopsys/opensmalltalk-vm/tree/Cog/image) folder you will find an image compressed in a zip that already have everything necessary to generate the sources for both the VM itself and all the plugins. The development images are Squeak Smalltalk images. At the time of writing, they were the only supported images for developing open-smalltalk. So, to open the image you will previously need to download a Squeak VM. You can do that from the [official Squeak website](http://squeak.org/) or try running the scripts the open-smalltalk VMs provide (note that, unfortunately, they are not always up to date):

    ./getGoodSpur64VM.sh
    
To generate the code just open a browser and run:

    VMMaker generateSqueakNOS64VM "This generates the code for the opensmalltalk-vm"
    VMMaker generateVMPlugins "This generates the code for all the plugins including SqueakNOSPlugin"

The image should contain the latest released version of the SqueakNOSPlugin. In case you would like to generate a completely fresh image with everything up to date, try (again, we are not in charge of the open-smalltalk. Usually the repo is stable but a few times we found that the build process was not up to date so, good luck! :) ):

    ./buildSpurTrunk64Image.sh
    
## Things to figure out if you have time: 

 - I really don't know why PharoV50.sources is needed, but without it the build script fails, so you have to download it by hand as in the instructions above. 
 - It would be great to know the minimal amount of apt package dependencies, if you have time to check that would be great.
 - When opening a Pharo 6 image a message window says it is an old VM, but things seem to work. We need to check what's the problem there.

## How to collaborate
We will create issues, here in github, with different degrees of complexity...
