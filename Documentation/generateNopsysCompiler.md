## Prepare the Environemnt

    export PREFIX="$HOME/opt/cross"
    export TARGET=SEEBELOW
    export PATH="$PREFIX/bin:$PATH"

*TARGET* selects the kind of executables that the compilation toolchain will generate. Actually Nopsys works in two different modes: 32 and 64 bits.
* For generating a toolchain for compiling 32 bits nopsys OSes select: TARGET=i686-elf
* For generating a toolchain for compiling 64 bits nopsys OSes select: TARGET=x86_64-elf

Finally, *PREFIX* defines where to install the new compilation toolchain and *PATH* adds the new toolchain to the path environment variable. 



## Generate binutils for Nopsys
 * Download [binutils](https://www.gnu.org/software/binutils/). Make sure to clone or download a release version.

Then inside the binutils directory: 

    ../configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
    make
    make install
    

Continue....
