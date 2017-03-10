# Nopsys
No Operating System Project: Seeking Dan Ingalls' quote: 'Operating Systems should not exist'

# Rationale
This project is a second revival (or *spin-off*) of the orginal SqueakNOS project borned at 2008. SqueakNOS had two previous stages. 
At a first stage, [Gerardo Richarte](...) (Richie) and [Luciano Notarfrancesco](https://github.com/len?tab=activity) depict the fundamentals of the project 
and build the basis. Most of the code contained in this repository was developed by them. 
The sources of that stage of the project can be found at: https://sourceforge.net/projects/squeaknos/.

In a second stage, during 2011-2012, [Javier Pimás](https://github.com/melkyades) and [Guido Chari](https://github.com/charig), in collaboration with Richie revived the project, made it compatible with Pharo Smalltalk and add Filesystem (FAT32) and Memory Management (Paging) support. This made it possible to snapshot images, an important milestone of the project. There is a blog with some documentation, the news of those days, and instructions to download prebuilt images: http://squeaknos.blogspot.com.ar/.

Now, we are working in a second revival! Smalltalk VMs (and also the images) have changed a lot since the old times. 
We have decided to give a new name to the project: Nopsys (No Operating System). The reason is that we do not want the 
project to be tightly coupled to any particular Smalltalk dialect. Besides, although we are developing the project in 
Smalltalk, and we considered ourselves Smalltalkers, actually the fundamental ideas are language-agnostic. 

## Publications
We are working on them. Nothing serious yet :). Hope to have news soon.

# Documentation

# Goals for this new version of Nopsys
- [ ] Make Nopsys work with the new family of Open-Smalltalk VMs (Stack, Cog, Spur) and with the up to date images 
(Pharo, Squeak, Cuis). 
- [ ] ... 

# How to build the project
Our goal is that building Nopsys becomes a *push one button* process. We have already put everything needed in this
repository. Unluckily, Nopsys depends on the open-smalltalk VMs, which have a very cumbersome building process. 
We would like to still work on improving the whole building process. By the moment, we provide a bunch of scripts 
for automatically generating all the needed artifacts. 

Obtaining, Building and Running Nopsys
---------------------------------------

To checkout the code:

    git clone https://github.com/charig/Nopsys.git
    
To build the project:

    git clone https://github.com/charig/Nopsys.git


# How to collaborate
We will create issues, here in github, with different degrees of complexity...
