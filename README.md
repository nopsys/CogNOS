# CogNOS

This repo contains a nopsys-style version of Cog VM. That means a Cog VM that runs a Squeak/Pharo/Cuis image without an OS.
For more information visit  https://github.com/nopsys/nopsys

## How to build the project
Our goal is that building Nopsys becomes a *push one button* process. We have already put everything needed in this
repository. Unluckily, Nopsys depends on the open-smalltalk VMs, which have a very cumbersome building process. 
We would like to still work on improving the whole building process. By the moment, we provide a bunch of scripts 
for automatically generating all the needed artifacts. 

To checkout the code:

    git clone https://github.com/nopsys/CogNOS.git
    git submodule update --init --recursive
    
To setup all the dependencies, both for building and development:

    bash scripts/setupRepo.sh
   
To build the project:

    ...
    
### Compiling Pharo VM

This step is not necessary at all, but might be a good excercise before building Cog/nopsys. To build it you have to install some dependencies. Remember that for now nopsys only supports 32-bit OS (if you want to help for a 64-bit migration just tell), so you have to install 32-bit versions of libs in your system.

*IMPORTANT*: These instructions were tested using Ubuntu 17.04/64-bits. We want to maintain them always up-to-date, so please inform if anything is not working, or if you are required to change something to make it work in other OSes. 

    $> sudo apt install gcc-multilib libc6-dev:i386 libasound2:i386 libasound2-dev:i386 libssl-dev:i386 libssl0.9.8:i386  libx11-dev:i386 libsm-dev:i386 libice-dev:i386 libgl1-mesa-glx:i386 libgl1-mesa-dev:i386 libxext-dev:i386 libglapi-mesa:i386 uuid-dev:i386 libcurl3-dev:i386
    $> cd CogNOS/opensmalltalk-vm
    $> mkdir sources && cd sources
    $> curl http://files.pharo.org/sources/PharoV50.sources.zip > PharoV50.sources.zip && unzip PharoV50.sources.zip
    $> cd ../build.linux32x86/pharo.cog.spur/build
    $> ./mvm

#### Things to figure out if you have time: 

 - I really don't know why PharoV50.sources is needed, but without it the build script fails, so you have to download it by hand as in the instructions above. 
 - It would be great to know the minimal amount of apt package dependencies, if you have time to check that would be great.
 - When opening a Pharo 6 image a message window says it is an old VM, but things seem to work. We need to check what's the problem there.

## How to collaborate
We will create issues, here in github, with different degrees of complexity...
