## MVSGCC

This is a port of the GCC compiler suite to IBM MVS, a predecessor of modern z/OS.

It has been repackaged here for easier collaboration. The original source can be found [here](http://gccmvs.sourceforge.net/).

In theory this package should also support CMS and VSE.

### Project Details

My original intent was to investigate symbol mangling to enable the MVS community to build larger pieces of open-source software.

One possible example might be SQLite or something like Lua. Both of them are small enough for MVS. The main problem is that symbols conflict.

I have no fixed plans on whether to proceed with this. Use at your own peril. Contributions are welcome though.

### Building on Windows

There is a set of batch files in the 'gcc' directory. They may or may not work.

### Building on POSIX

Currently only the initial cross-compile stage can be built.

On most UNIX environments all you need to do is 'make'. At the moment this will
build cross-compilers for MVS, CMS and VSE. Read the makefile for other options.

My new make-based build system does not support building a C library yet. You
would normally use something called PDPCLIB for that.

