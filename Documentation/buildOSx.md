# Compilation Instructions

## Cross-Compilation
By the moment, the executable we generate must be in [ELF 64](https://www.uclibc.org/docs/elf-64-gen.pdf) format.  
Since ELF is the official output for UNIX systems, compiling Nopsys from any other family of OS needs a cross compilation.

Any cross-compilation setting should work after informing the relevant variables to the Makefile (declared in the compilation.conf file under the nopsys folder).

For compiling from Mac OSx we redirect the reader to the [document](generateNopsysCompiler.md) explaining how to generate a gcc cross compiler for x86_64.

## Dependencies

Required packages:     
    
    brew install nasm gmp mpfr libmpc autoconf automake xorriso

#### GRUB
    
    export PREFIX="$HOME/opt/"
    export TARGET=x86_64-elf
    export PATH="$PREFIX/bin:$PATH"
    git clone --depth 1 git://git.savannah.gnu.org/grub.git
    cd grub
    sh autogen.sh
    cd build-grub
    ../configure --disable-werror TARGET_CC=$TARGET-gcc TARGET_OBJCOPY=$TARGET-objcopy \
    TARGET_STRIP=$TARGET-strip TARGET_NM=$TARGET-nm TARGET_RANLIB=$TARGET-ranlib --target=$TARGET --prefix=$PREFIX
    make
    make install
