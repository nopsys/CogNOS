# CogNOS

This repo contains a nopsys-style version of Cog VM. That means a Cog VM that runs a Squeak/Pharo/Cuis image without an OS.
For more information visit  https://github.com/nopsys/nopsys

## How to build the project
Our goal is that building Nopsys becomes a *push one button* process. We have already put everything needed in this
repository. Unluckily, Nopsys depends on the open-smalltalk VMs, which have a very cumbersome building process. 
We would like to still work on improving the whole building process. By the moment, we provide a bunch of scripts 
for automatically generating all the needed artifacts. 

For now nopsys only supports 64-bit OS. 

To checkout the code:

    git clone https://github.com/nopsys/CogNOS.git
    git submodule update --init --recursive
    
To setup the repo both, for building and development:

    bash scripts/setupRepo.sh
    
Install dependencies (for making a bootable iso):

    sudo apt install grub-pc-bin xorriso
    
[Click here](Documentation/buildOSx.md) for dependency instructions in OSx      


To build it:

    cd opensmalltalk-vm/platforms/nopsys
    make  # builds vm.obj
    make iso # builds libnopsys.lib and links it to vm.obj

And finally to try it, we support _all_ main system vms available: qemu, VirtualBox, 
VMWare and Bochs. You can even run the image with an attached gdb (through qemu)

    make try-qemu    # runs it using qemu
    make try-qemudbg # runs it using qemu attaching a gdb to debug remotely and with symbols!!!
    make try-bochs   # runs it using bochs
    make try-vbox    # runs it using VirtualBox
    make try-vmware  # runs it using WMWare player


Currently I (pocho) suggest using qemu, it is fast, open and lightweight. Installs with:

    sudo apt install qemu

## Development instructions

There are two ways of contributing. At the image level or at the VM level.

#### Image-level contributions
This is the standard way of contributing. Usually most users will work only at the image level. If all your contributions live at the image side then you could just make a pull request of smalltalk code to the SqueakNOS repository. 

(Setup the corresponding git repo) 

#### VM-level contributions

The SqueakNOS code at the Virtual Machine level follows the standard Squeak development process. This means that we have a plugin written in Slang (SqueakNOSPlugin) and we generate the C code to compile it from an Smalltalk image.   
So, if you are working with some very low-level features, found low-level bugs or just would like to propose a new primitive you will need to change the Slang code. 

Under the [image](https://github.com/nopsys/opensmalltalk-vm/tree/Cog/image) folder you will find an image that already have everything necessary to generate the sources for both the VM itself and all the plugins. To generate the code just open a browser and run:

    VMMaker generateSqueakNOS64VM "This generates the code for the opensmalltalk-vm"

    VMMaker generateVMPlugins "This generates the code for all the plugins including SqueakNOSPlugin"

The image should contain the last released version of the SqueakNOSPlugin. In case you want to update to the latest development version you can do that using the monticello browser.

The images are Squeak Smalltalk images. At the time of writing, they were the only supported images for developing open-smalltalk. So, to open the image you will previously need to download a Squeak VM. You can do that from the [official Squeak website](http://squeak.org/) or try running the scripts the open-smalltalk VMs provide (note that, unfortunately, they are not always up to date):

    ./getGoodSpur64VM.sh
    
In case you would like to generate a completely fresh image with everything up to date try (good luck! :) ):

    ./buildSpurTrunk64Image.sh
    
#### Things to figure out if you have time: 

 - I really don't know why PharoV50.sources is needed, but without it the build script fails, so you have to download it by hand as in the instructions above. 
 - It would be great to know the minimal amount of apt package dependencies, if you have time to check that would be great.
 - When opening a Pharo 6 image a message window says it is an old VM, but things seem to work. We need to check what's the problem there.

## How to collaborate
We will create issues, here in github, with different degrees of complexity...
