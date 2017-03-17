# Compilation Instructions

## Cross-Compilation
By the moment, the executable we generate must be in [ELF 32](http://web.archive.org/web/20070225114551/http://pdos.csail.mit.edu/6.828/2005/readings/elf.pdf) format.  
Since ELF is the official output for UNIX systems, compiling Nopsys from any other family of OS needs a cross compilation.

Any cross-compilation setting should work after informing the relevant variables of the Makefile (declared in the Makefile.tools file).

For compiling from Mac OSx we are using a prebuilt gcc found [here](http://crossgcc.rts-software.org/doku.php?id=compiling_for_linux): 
