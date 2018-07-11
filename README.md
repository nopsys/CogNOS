# CogNOS in a nutshell

This repo contains a nopsys-style version of the Cog VM. That means a Cog VM that runs a Squeak/Pharo/Cuis image without an OS. For more information on the nopsys library visit  https://github.com/nopsys/nopsys.

![screenshot](Documentation/screenshot.png)

CogNOS is actually a third iteration of the orginal SqueakNOS project born at early 2000's. SqueakNOS had two previous stages. 
At a first stage, [Gerardo Richarte]() (Richie) and [Luciano Notarfrancesco]() depicted the fundamentals of the project 
and built its basis. Most of the code contained in this and related repositories was developed by them. 
The sources of that stage of the project can be found at: https://sourceforge.net/projects/squeaknos/.

In a second stage, during 2011-2012, [Javier Pimás](https://github.com/melkyades) and [Guido Chari](https://github.com/charig), in collaboration with Richie revived the project and made it compatible with Pharo Smalltalk. In addition, we added Filesystem (FAT32) and Memory Management (paging) support. This made it possible to snapshot images, an important milestone of the project. There is a blog with some documentation, the news of those days, and instructions to download prebuilt images: http://squeaknos.blogspot.com.ar/.

Now, we are working in a second revival! Smalltalk VMs (and also images) have changed a lot since the old times. 
We have decided to give a new name to the project: CogNOS since  we do not want the project to be tightly coupled to any particular Smalltalk dialect. 

## Using CogNOS
We provide a release version in the form of a [compressed file](../../releases/latest). To run it you need a virtual machine software install in your OS. Currently we provide support for:
* VirtualBox
* VMWare
* Qemu
* Bochs

Choose whichever you prefer. We recommend virtualbox since it is free, multiplatform, and is the fastest solution. Qemu and Bochs are much slower, but at the same time they provide much more low-level debugging facilities in case you need them.

So to run CogNOS just uncompress the file, enter the CogNOS directory and run: `./run.sh vbox`. Change vbox for qemu, bochs or vmware to change the VM software.  

## Building

If you want to build everything from scratch, we provide a few scripts that make it easy. Go to [BUILDING.md](BUILDING.md) for instructions.
    
## Contributing

There are two ways of contributing. At the image level or at the VM level.

### Image-level contributions
This is the standard way of contributing. Usually most users will work only at the image level. If all your contributions live at the image side then you could just make a pull request of smalltalk code to the SqueakNOS repository. Note that by default, the official nopsys git repository is configured in the Iceberg git tool. You should update that to your own clone to be able to push and then submit a pull request.

### VM-level contributions

Modifications and additions to the Cog VM in CogNOS follow the standard Squeak development process: there is a plugin written in Slang (SqueakNOSPlugin) which is used to generate the corresponding C code from an Smalltalk image.   
So, if you are working with some very low-level features, found low-level bugs, or just would like to propose a new primitive you will need to change the Slang code. 

Under the [image](https://github.com/nopsys/opensmalltalk-vm/tree/Cog/image) folder you will find an image compressed in a zip that already have everything necessary to generate the sources for both the VM itself and all the plugins. The development images are Squeak Smalltalk images. At the time of writing, they were the only supported images for developing open-smalltalk.
So to open the image and generate the sources see the previous section #4. Build CogNOS. The image should contain the latest released version of the SqueakNOSPlugin. 

<!--In case you would like to generate a completely fresh image with everything up to date, try (again, we are not in charge of the open-smalltalk. Usually the repo is stable but a few times we found that the build process was not up to date so, good luck! :) ):

    ./buildSpurTrunk64Image.sh-->

### How to collaborate

Have a look at CogNOS issues tracker on GitHub, we've left many tasks with different degrees of complexity.

<!--
### Things to figure out if you have time: 

 - I really don't know why PharoV50.sources is needed, but without it the build script fails, so you have to download it by hand as in the instructions above. 
 - It would be great to know the minimal amount of apt package dependencies, if you have time to check that would be great.
 - When opening a Pharo 6 image a message window says it is an old VM, but things seem to work. We need to check what's the problem there.
 -->

