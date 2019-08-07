rem the purpose of this build is to ensure that GCC can be
rem compiled on standard hardware, ie S/370 and S/390. So the
rem stage1 GCC executable is assembled and linked on S/370.
rem then the source is recompiled under PDOS on a S/390.

rem however, you normally want to build a S/380 of GCC
rem at both stages.

cd ..\..\pdos\pdpclib

del *.o
make -f makefile.w32

cd ..\..\gcc\gcc

gcc -s -mno-cygwin -O2 -o mvsendec ../../pdos/pdpclib/mvsendec.c

rem !!!!!!!
rem This is useful during testing to get a faster compile but
rem should NOT be used for release
rem !!!!!!!
rem call fudge

call compile
call compmvs -ansi -pedantic-errors
call zipmvs
call subjobs_pdos

call zippdos

rem now we rebuild GCC from source on PDOS, and compare results
rem with what we had on the PC via cross-compile
call runpdos comppdos.bat output.txt all.zip
