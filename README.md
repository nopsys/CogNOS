# CogNOS in a nutshell

This repo contains a nopsys-style version of Cog VM. That means a Cog VM that runs a Squeak/Pharo/Cuis image without an OS.
For more information visit  https://github.com/nopsys/nopsys

## Building CogNOS

We haven't done any release yet, so the only way to try CogNOS is to build it yourself, which shall be easy.
One of our goals is that both using and building Nopsys becomes a *push one button* process.
Everything that is needed has already been put in the CogNOS repository.

## Fetching and building artifacts

To build CogNOS you will need several artifacts:

- a compiled `64-bit cog vm` - to be able to run a squeak/pharo/cuis image you need an already working Cog VM.
- a `64-bit spur squeak/pharo/cuis NOS image` - this image will contain the "OS" drivers. 
- the sources of `opensmalltalk-vm` - to run `Cog` within `nopsys` you need the sources of `Cog`
- a `64-bit squeak vmmaker image` - this is needed only to translate SqueakNOS slang plugin to C.

Below we describe how to automatically generate all the needed artifacts. 

<!--
- a `nopsys` repo - will provide the infrastructure to build a basic libnopsys, link it with the Cog VM and generate a bootable ISO image. Also will let us run the ISO image in a system VM like VirtualBox or QEMU.
-->


#### 1. Checkout the CogNOS:

    git clone https://github.com/nopsys/CogNOS.git
<!--    git submodule update --init --recursive -->

The CogNOS repo contains the scripts that will download all other artifacts.

#### 2. Setup the repo, both for building and development:

    bash scripts/setupRepo.sh
    
This script will download and configure all the needed smalltalk images and a compiled VM to run them.

#### 3. Install dependencies (for making a bootable iso):

    sudo apt install grub-pc-bin xorriso
    
[Click here](Documentation/buildOSx.md) for dependency instructions in OSx      

#### 4. Build CogNOS:

Currently, this consists of two steps: 
1. Translating Slang sources to C 
2. Build them. 

While we are trying to automate the first step, you'll still need to do some manual work. Open the VMMaker
image from a terminal, like this:

    cd opensmalltalk-vm/image
    
    ./sqlinux.201805090836/squeak BuildCogNOS.image (on linux)
or
    ./Squeak64.201805090836.app/Contents/MacOS/Squeak (on OSX)

You'll find a workspace there. You need to execute these two lines:

    VMMaker generateSqueakNOS64VM
    VMMaker generateSqueakNOSPlugins

If asked about overwriting files, just answer yes. You can quit the image without saving. We are
ready for the second step, to build everything: 

    cd ../opensmalltalk-vm/platforms/nopsys
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


Depending on the kind of work you want to do, we suggest using different VMs. For trying it, VirtualBox
is the fastest. If you want to debug Cog VM, we suggest using qemu which, while not as fast as VB,
is open, easy to install and lightweight. It installs with:

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

## How to debug low level problems

Debugging smalltalk code is easy when you have a smalltalk browser available, but low
level problems just break the VM so it is harder to understand what is going on.
A few tips go here:

 - There are basically two low debugging workflows: `make try-bochs` and `make try-qemudbg`.
   With bochs you get extreme low level information (i.e. you can see the IDT, GDT, PT), but
   you can't see C code, emulation is slow and the debugging cli is pretty basic. With qemu
   you loose low level details but in exchange you get a full blown GDB console. We recommend
   using qemudbg unless looking for _really_ basic and low level errors.

 - To launch `qemudbg` you'll have to adjust a _magic_ number in the `Makefile` ;). This is because
   of a problem with `gdb`. If `gdb` connected directly, it would see code running in 32-bit mode, and then 
   when switching to long mode (64 bits) it will go crazy. Our workaround is to connect after a few
   seconds of simulation (to guarantee that `gdb` only sees 64 bits mode). To do this you have to go to the
   `Makefile` in `opensmalltalk-vm/platforms/nopsys` and change the `sleep` line to some value according
   to the speed of your machine. Waiting ~6 seconds is usually enough.

 - When using `qemudbg`, it will pause execution after connection. You'll have to manually continue
   execution. You can use that pause to place a few breakpoints. It can be useful to put a break in
   `warning` so that it pauses each time an assertion fails.

 - If you focus on the cli and press `ctrl+c`, execution will pause. There you can execute things like
   `bt` to print the C stack, or even something like `p printCallStack()` to show the smalltalk call
   stack (this may or may not work depending on the instant on which the VM got paused, you may have to try a
   few times, rebooting each time).

 - If you want, from smalltalk code, to show a message in the low-level console, you can just use
   this: `Computer show: aString`


