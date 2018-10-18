## Building CogNOS
We provide support for building the whole toolchain needed for development: everything that is eventually needed for building any version of the project should be available after following this instructions.

Thanks to Travis CI, all commits of this repository are tested to check that the development toolchain is working under the linux platform. We are working to do the same for OSx.
The current build status is: [![Build Status](https://travis-ci.org/nopsys/CogNOS.svg?branch=master)](https://travis-ci.org/CogNOS/CogNOS). If status is *passing* and you have any problem in your setting it may happen you are missing some dependencies. We suggest to search in the travis builds for the whole needed setup. 

### macOS
We currently do not provide support building CogNOS under the macOS platform. However, we do it by using a cross-compiler. if If you want to give a try, [here](buildOSx.md) you will find instructions on how we build and setup a cross-compiler.  

### Fetching and building artifacts

To build CogNOS you will need several artifacts:

- the [nopsys](https://github.com/nopsys/nopsys) library sources.
- the sources of a slightly modified `opensmalltalk-vm` containing adaptations needed to link Cog to the nopsys library.
- a `64-bit spur squeak/pharo/cuis NOS` image that contains the "OS" drivers and will act as the OS when linked to nopsys. 
- a `64-bit squeak vmmaker image` containing all the VM sources written in Slang (including the SqueakNOS plugin) that need to be translated to C before building the final VM.
- a `64-bit cog vm` to run the image for generating the sources.

Below we describe how to automatically generate all the needed artifacts. 

#### 1. Checkout CogNOS:

    git clone https://github.com/nopsys/CogNOS.git
<!--    git submodule update --init --recursive -->

The CogNOS repo contains the scripts that will download all other artifacts.

#### 2. Setup the repo, both for building and development:

Note that this step may take around 1-5 minutes to finish. 

    cd CogNOS (or the name you chose)
    bash scripts/setupRepo.sh
    
This script will download and configure all the needed smalltalk images and a compiled VM to run them.

#### 3. Install dependencies (for making a bootable iso):

    sudo apt install grub-pc-bin xorriso
    
[Click here](Documentation/buildOSx.md) for dependency instructions in OSx      


#### 4. Build CogNOS:

    bash scripts/build/build.sh

If you have any problem with the command you can try to do this step manually. The building consists of two steps: 

1. Translating Slang sources to C 
2. Build them. 

For the first step you can just run `./scripts/buildSources.sh`. Alternatively, you can also generate the sources manually. This means open the VMMaker image from a terminal, like this:

    cd opensmalltalk-vm/image
    
    ./sqlinux.201805090836/squeak BuildCogNos.image (on linux)
    or
    ./Squeak64.201805090836.app/Contents/MacOS/Squeak (on OSX)

You'll find a workspace there. You need to execute these two lines:

    VMMaker generateSqueakNOS64VM (or VMMaker generateSqueakNOS64Stack, for the interpreter version)
    VMMaker generateSqueakNOSPlugins

If asked about overwriting files, just answer yes. You can quit the image without saving. 

To build everything: 

    cd opensmalltalk-vm/platforms/nopsys
    make  # builds vm.obj
    
and to create a bootable media file:

    make iso # builds libnopsys.lib, links it to vm.obj and generates a bootable ISO image
    make hd  # builds libnopsys.lib, links it to vm.obj and generates a hard-disk image

#### 5. Try it

We support _all_ main system vms available: qemu, VirtualBox, 
VMWare and Bochs. You can even run the image with an attached gdb (through qemu)

    cd ../opensmalltalk-vm/platforms/nopsys (only if you are not already there)
    make try-qemu       # runs it using qemu
    make try-qemudbg    # runs it using qemu attaching a gdb to debug remotely and with symbols!!!
    make try-bochs      # runs it using bochs
    make try-virtualbox # runs it using VirtualBox
    make try-vmware     # runs it using WMWare player


Depending on the kind of work you want to do, we suggest using different VMs. For trying it, VirtualBox
is the fastest. If you want to debug Cog VM, we suggest using qemu which, while not as fast as VB,
is open, easy to install and lightweight. It installs with:

    sudo apt install qemu

To try it with a hard-disk image instead of a CD, call make with STORAGE=hd, like this:

    make try-vmware STORAGE=hd


### How to debug low level problems

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

