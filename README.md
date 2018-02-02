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


## How to collaborate
We will create issues, here in github, with different degrees of complexity...
