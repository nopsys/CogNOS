## Disclaimer
The instructions to build a cross-compiler were taken mainly from the [OSdev wiki](https://wiki.osdev.org/GCC_Cross-Compiler). In case you found any problem with the steps below please refer to the wiki to check if there is any clarification there for the dependecies on your platform.

## Prepare the Environemnt

    export PREFIX="$HOME/opt/cross"
    export TARGET=SEEBELOW
    export PATH="$PREFIX/bin:$PATH"

*TARGET* selects the kind of executables that the compilation toolchain will generate. Actually Nopsys works in two different modes: 32 and 64 bits.
* For generating a toolchain for compiling 32 bits nopsys OSes select: TARGET=i686-elf
* For generating a toolchain for compiling 64 bits nopsys OSes select: TARGET=x86_64-elf

Finally, *PREFIX* defines where to install the new compilation toolchain and *PATH* adds the new toolchain to the path environment variable.

## Prepare the Environemnt
Consider running the following commands to ensure all the most important dependencies are already installed:
    brew install gmp
    brew install mpfr
    brew install libmpc

## Generate binutils for Nopsys
 * Download [binutils](https://www.gnu.org/software/binutils/) sources. Make sure to clone or download a release version.

You should create an independent build directory outside the binutils sources directory. Then run: 

    cd buildDir
    ../binutils-version/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
    make
    make install

--disable-nls tells binutils not to include native language support. This reduces dependencies and compile time. It will also result in English-language diagnostics.

--with-sysroot tells binutils to enable sysroot support in the cross-compiler by pointing it to a default empty directory. By default, the linker refuses to use sysroots for no good technical reason, while gcc is able to handle both cases at runtime. 
*TODO: Check if this last option is needed*

## Generate gcc for Nopsys

 * Download [gcc](https://www.gnu.org/software/gcc/mirrors.html) sources. Make sure to download a release version similar to the current gcc/clang that is installed in your OS to ensure that your native compiler can compile the new gcc.
 
Again you should create an independent build directory outside the gcc sources directory. Then run: 
 
    cd buildDir
    ../gcc-version/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
    make all-gcc
    make all-target-libgcc (Is this actually needed?)
    make install-gcc
    make install-target-libgcc
    
We build libgcc, a low-level support library that the compiler expects available at compile time. Linking against libgcc provides integer, floating point, decimal, stack unwinding (useful for exception handling) and other support functions. Note how we are not simply running make && make install as that would build way too much, not all components of gcc are ready to target your unfinished operating system.

--disable-nls is the same as for binutils above.

--without-headers tells GCC not to rely on any C library (standard or runtime) being present for the target.

--enable-languages tells GCC not to compile all the other language frontends it supports, but only C (and optionally C++).   

## Use the new compiler
To use the just generated cross-compiler to compile nopsys you should only provide the path where you decided to install the toolchain to the compilation.conf file. You could check the whole set of configurable variables in the [example version of the file]().  
     
