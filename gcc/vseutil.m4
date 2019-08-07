* $$ JOB JNM=VSEJOB
* $$ LST LST=SYSLST,CLASS=A,RBM=999999
// JOB VSEJOB
*
*
*
* Standard assignments for C programs
*
// ASSGN SYS000,SYSLNK
// ASSGN SYS005,SYSLST
// ASSGN SYS007,SYSPCH
// OPTION DUMP
// OPTION NOLIST
*
*
* DOS/VS by default stores data in the first 4000 tracks, so
* steer clear of them.
*
* Assemble prolog/epilog macros
*
// OPTION EDECK,NODECK  
// DLBL IJSYSPH,'PDPPUNCH.DAT',0,SD
// EXTENT SYSPCH,,,,10000,100 SPACE-SYSPUNCH
ASSGN SYSPCH,SYS000
// EXEC ASSEMBLY
undivert(pdpprlg.mac)undivert(pdpepil.mac)         END
/*
CLOSE SYSPCH,PUNCH
// OPTION NOEDECK
*
*
* Put them into the macro library
*
// DLBL IJSYSIN,'PDPPUNCH.DAT'
ASSGN SYSIPT,SYS000
// EXEC MAINT                                         
CLOSE SYSIPT,READER
*
*
*
*
* Put the copy lib straight in
*
// EXEC MAINT
 CATALS A.PDPTOP
 BKEND
undivert(pdptop.mac) BKEND
/*
*
*
*
*
* Now assemble and link copyfile
*
* // OPTION LINK
// OPTION CATAL
 PHASE COPYFILE,S+80
// EXEC ASSEMBLY
undivert(vsestart.asm)/*
*
* assemble the subroutines
*
* // OPTION LINK
*  // OPTION CATAL
// EXEC ASSEMBLY
undivert(start.s)/*
// EXEC ASSEMBLY
undivert(stdio.s)/*
// EXEC ASSEMBLY
undivert(stdlib.s)/*
// EXEC ASSEMBLY
undivert(ctype.s)/*
// EXEC ASSEMBLY
undivert(string.s)/*
// EXEC ASSEMBLY
undivert(time.s)/*
// EXEC ASSEMBLY
undivert(errno.s)/*
// EXEC ASSEMBLY
undivert(assert.s)/*
// EXEC ASSEMBLY
undivert(locale.s)/*
// EXEC ASSEMBLY
undivert(math.s)/*
// EXEC ASSEMBLY
undivert(setjmp.s)/*
// EXEC ASSEMBLY
undivert(signal.s)/*
// EXEC ASSEMBLY
undivert(__memmgr.s)/*
// EXEC ASSEMBLY
undivert(vsesupa.asm)/*
// EXEC ASSEMBLY
undivert(copyfile.s)/*
*
* Now link copyfile
*
// EXEC LNKEDT
*
*
* Now assemble and link hexdump
*
* // OPTION LINK
// OPTION CATAL
 PHASE HEXDUMP,S+80
// EXEC ASSEMBLY
undivert(vsestart.asm)/*
*
* assemble the subroutines
*
* // OPTION LINK
*  // OPTION CATAL
// EXEC ASSEMBLY
undivert(start.s)/*
// EXEC ASSEMBLY
undivert(stdio.s)/*
// EXEC ASSEMBLY
undivert(stdlib.s)/*
// EXEC ASSEMBLY
undivert(ctype.s)/*
// EXEC ASSEMBLY
undivert(string.s)/*
// EXEC ASSEMBLY
undivert(time.s)/*
// EXEC ASSEMBLY
undivert(errno.s)/*
// EXEC ASSEMBLY
undivert(assert.s)/*
// EXEC ASSEMBLY
undivert(locale.s)/*
// EXEC ASSEMBLY
undivert(math.s)/*
// EXEC ASSEMBLY
undivert(setjmp.s)/*
// EXEC ASSEMBLY
undivert(signal.s)/*
// EXEC ASSEMBLY
undivert(__memmgr.s)/*
// EXEC ASSEMBLY
undivert(vsesupa.asm)/*
// EXEC ASSEMBLY
undivert(hexdump.s)/*
*
* link hexdump
*
// EXEC LNKEDT
*
*
* Now assemble and link mvsendec
*
* // OPTION LINK
// OPTION CATAL
 PHASE MVSENDEC,S+80
// EXEC ASSEMBLY
undivert(vsestart.asm)/*
*
* assemble the subroutines
*
* // OPTION LINK
*  // OPTION CATAL
// EXEC ASSEMBLY
undivert(start.s)/*
// EXEC ASSEMBLY
undivert(stdio.s)/*
// EXEC ASSEMBLY
undivert(stdlib.s)/*
// EXEC ASSEMBLY
undivert(ctype.s)/*
// EXEC ASSEMBLY
undivert(string.s)/*
// EXEC ASSEMBLY
undivert(time.s)/*
// EXEC ASSEMBLY
undivert(errno.s)/*
// EXEC ASSEMBLY
undivert(assert.s)/*
// EXEC ASSEMBLY
undivert(locale.s)/*
// EXEC ASSEMBLY
undivert(math.s)/*
// EXEC ASSEMBLY
undivert(setjmp.s)/*
// EXEC ASSEMBLY
undivert(signal.s)/*
// EXEC ASSEMBLY
undivert(__memmgr.s)/*
// EXEC ASSEMBLY
undivert(vsesupa.asm)/*
// EXEC ASSEMBLY
undivert(mvsendec.s)/*
*
* link mvsendec
*
// EXEC LNKEDT
*
*
*
*
* Now assemble and link mvsunzip
*
* // OPTION LINK
// OPTION CATAL
 PHASE MVSUNZIP,S+80
// EXEC ASSEMBLY
undivert(vsestart.asm)/*
*
* assemble the subroutines
*
* // OPTION LINK
*  // OPTION CATAL
// EXEC ASSEMBLY
undivert(start.s)/*
// EXEC ASSEMBLY
undivert(stdio.s)/*
// EXEC ASSEMBLY
undivert(stdlib.s)/*
// EXEC ASSEMBLY
undivert(ctype.s)/*
// EXEC ASSEMBLY
undivert(string.s)/*
// EXEC ASSEMBLY
undivert(time.s)/*
// EXEC ASSEMBLY
undivert(errno.s)/*
// EXEC ASSEMBLY
undivert(assert.s)/*
// EXEC ASSEMBLY
undivert(locale.s)/*
// EXEC ASSEMBLY
undivert(math.s)/*
// EXEC ASSEMBLY
undivert(setjmp.s)/*
// EXEC ASSEMBLY
undivert(signal.s)/*
// EXEC ASSEMBLY
undivert(__memmgr.s)/*
// EXEC ASSEMBLY
undivert(vsesupa.asm)/*
// EXEC ASSEMBLY
undivert(mvsunzip.s)/*
*
* link mvsunzip
*
// EXEC LNKEDT
*
*
*
*
* Now assemble and link vseproc
*
* // OPTION LINK
// OPTION CATAL
 PHASE VSEPROC,S+80
// EXEC ASSEMBLY
undivert(vsestart.asm)/*
*
* assemble the subroutines
*
* // OPTION LINK
*  // OPTION CATAL
// EXEC ASSEMBLY
undivert(start.s)/*
// EXEC ASSEMBLY
undivert(stdio.s)/*
// EXEC ASSEMBLY
undivert(stdlib.s)/*
// EXEC ASSEMBLY
undivert(ctype.s)/*
// EXEC ASSEMBLY
undivert(string.s)/*
// EXEC ASSEMBLY
undivert(time.s)/*
// EXEC ASSEMBLY
undivert(errno.s)/*
// EXEC ASSEMBLY
undivert(assert.s)/*
// EXEC ASSEMBLY
undivert(locale.s)/*
// EXEC ASSEMBLY
undivert(math.s)/*
// EXEC ASSEMBLY
undivert(setjmp.s)/*
// EXEC ASSEMBLY
undivert(signal.s)/*
// EXEC ASSEMBLY
undivert(__memmgr.s)/*
// EXEC ASSEMBLY
undivert(vsesupa.asm)/*
// EXEC ASSEMBLY
undivert(vseproc.s)/*
*
* link vseproc
*
// EXEC LNKEDT
*
*
*
*
* Now assemble and link vsemanip
*
* // OPTION LINK
// OPTION CATAL
 PHASE VSEMANIP,S+80
// EXEC ASSEMBLY
undivert(vsestart.asm)/*
*
* assemble the subroutines
*
* // OPTION LINK
*  // OPTION CATAL
// EXEC ASSEMBLY
undivert(start.s)/*
// EXEC ASSEMBLY
undivert(stdio.s)/*
// EXEC ASSEMBLY
undivert(stdlib.s)/*
// EXEC ASSEMBLY
undivert(ctype.s)/*
// EXEC ASSEMBLY
undivert(string.s)/*
// EXEC ASSEMBLY
undivert(time.s)/*
// EXEC ASSEMBLY
undivert(errno.s)/*
// EXEC ASSEMBLY
undivert(assert.s)/*
// EXEC ASSEMBLY
undivert(locale.s)/*
// EXEC ASSEMBLY
undivert(math.s)/*
// EXEC ASSEMBLY
undivert(setjmp.s)/*
// EXEC ASSEMBLY
undivert(signal.s)/*
// EXEC ASSEMBLY
undivert(__memmgr.s)/*
// EXEC ASSEMBLY
undivert(vsesupa.asm)/*
// EXEC ASSEMBLY
undivert(vsemanip.s)/*
*
* link vsemanip
*
// EXEC LNKEDT
*
*
*
*
* Now punch the phases
*
// DLBL IJSYSPH,'PDPPUNCH.DAT',0,SD
// EXTENT SYSPCH,,,,10000,1000 SPACE-SYSPUNCH
ASSGN SYSPCH,SYS000
// EXEC CSERV
 PUNCH COPYFILE
 PUNCH HEXDUMP
 PUNCH MVSENDEC
 PUNCH MVSUNZIP
 PUNCH VSEPROC
 PUNCH VSEMANIP
/*
CLOSE SYSPCH,PUNCH
*
*
* And put it to tape
*
// DLBL SDI1,'PDPPUNCH.DAT'
// TLBL MTO1,'HERC01.MFTOPC',0
// ASSGN SYS011,TAPE,VOL=MFTOPC
// EXEC VSEMANIP,SIZE=AUTO,PARM='dd:sdi1 dd:mto1'
*
*
*
*
/&
* $$ EOJ
