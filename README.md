## MVSGCC

This is a port of the GCC compiler suite to IBM MVS, a predecessor of modern z/OS.

It has been repackaged here for easier collaboration.

### Building

On most UNIX environments all you need to do is 'make'. At the moment this will
build cross-compilers for MVS, CMS and VSE. Read the makefile for other options.

My new make-based build system does not support building a C library yet. You
would normally use something called PDPCLIB for that.


