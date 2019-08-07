/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/PARM *
/INC PURGE
/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE PDPASM REPL
/inc rexx
parse arg name
queue "/file syspunch n("name".obj) new(repl) sp(100) secsp(100%)"
queue "/file syslib pds(@BLD000:*.M,$MCU:*.M)"
queue "/load asm"
queue "/job nogo"
queue "/opt deck,list"
queue "/inc" name".asm"
"EXEC"

exit rc
/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE PDPTOP.M REPL
undivert(pdptop.mac)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE PDPPRLG.M REPL
undivert(pdpprlg.mac)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE PDPEPIL.M REPL
undivert(pdpepil.mac)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE MUSSTART.ASM REPL
undivert(musstart.asm)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE MUSSUPA.ASM REPL
undivert(mussupa.asm)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE START.ASM REPL
undivert(start.s)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE STDIO.ASM REPL
undivert(stdio.s)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE STDLIB.ASM REPL
undivert(stdlib.s)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE CTYPE.ASM REPL
undivert(ctype.s)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE STRING.ASM REPL
undivert(string.s)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE TIME.ASM REPL
undivert(time.s)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE ERRNO.ASM REPL
undivert(errno.s)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE ASSERT.ASM REPL
undivert(assert.s)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE LOCALE.ASM REPL
undivert(locale.s)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE MATH.ASM REPL
undivert(math.s)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE SETJMP.ASM REPL
undivert(setjmp.s)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE SIGNAL.ASM REPL
undivert(signal.s)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE __MEMMGR.ASM REPL
undivert(__memmgr.s)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE COPYFILE.ASM REPL
undivert(copyfile.s)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE HEXDUMP.ASM REPL
undivert(hexdump.s)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE MVSUNZIP.ASM REPL
undivert(mvsunzip.s)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/SAVE MVSENDEC.ASM REPL
undivert(mvsendec.s)/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/inc rexx
'pdpasm start'
'pdpasm stdio'
'pdpasm stdlib'
'pdpasm ctype'
'pdpasm string'
'pdpasm time'
'pdpasm errno'
'pdpasm assert'
'pdpasm locale'
'pdpasm math'
'pdpasm setjmp'
'pdpasm signal'
'pdpasm __memmgr'
'pdpasm mussupa'
'pdpasm musstart'
'pdpasm copyfile'
'pdpasm hexdump'
'pdpasm mvsunzip'
'pdpasm mvsendec'
/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/sys region=9999
/file lmod n(copyfile.lmod) new(repl) lr(128) recfm(f) sp(100) shr
/load lked
/job map,nogo,print,stats,mode=os,name=copyfile
.org 4a00
/inc copyfile.obj
/inc musstart.obj
/inc mussupa.obj
/inc __memmgr.obj
/inc assert.obj
/inc ctype.obj
/inc errno.obj
/inc locale.obj
/inc math.obj
/inc setjmp.obj
/inc signal.obj
/inc start.obj
/inc stdio.obj
/inc stdlib.obj
/inc string.obj
/inc time.obj
 ENTRY @@MAIN
/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/sys region=9999
/file lmod n(hexdump.lmod) new(repl) lr(128) recfm(f) sp(100) shr
/load lked
/job map,nogo,print,stats,mode=os,name=hexdump
.org 4a00
/inc hexdump.obj
/inc musstart.obj
/inc mussupa.obj
/inc __memmgr.obj
/inc assert.obj
/inc ctype.obj
/inc errno.obj
/inc locale.obj
/inc math.obj
/inc setjmp.obj
/inc signal.obj
/inc start.obj
/inc stdio.obj
/inc stdlib.obj
/inc string.obj
/inc time.obj
 ENTRY @@MAIN
/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/sys region=9999
/file lmod n(mvsunzip.lmod) new(repl) lr(128) recfm(f) sp(100) shr
/load lked
/job map,nogo,print,stats,mode=os,name=mvsunzip
.org 4a00
/inc mvsunzip.obj
/inc musstart.obj
/inc mussupa.obj
/inc __memmgr.obj
/inc assert.obj
/inc ctype.obj
/inc errno.obj
/inc locale.obj
/inc math.obj
/inc setjmp.obj
/inc signal.obj
/inc start.obj
/inc stdio.obj
/inc stdlib.obj
/inc string.obj
/inc time.obj
 ENTRY @@MAIN
/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/sys region=9999
/file lmod n(mvsendec.lmod) new(repl) lr(128) recfm(f) sp(100) shr
/load lked
/job map,nogo,print,stats,mode=os,name=mvsendec
.org 4a00
/inc mvsendec.obj
/inc musstart.obj
/inc mussupa.obj
/inc __memmgr.obj
/inc assert.obj
/inc ctype.obj
/inc errno.obj
/inc locale.obj
/inc math.obj
/inc setjmp.obj
/inc signal.obj
/inc start.obj
/inc stdio.obj
/inc stdlib.obj
/inc string.obj
/inc time.obj
 ENTRY @@MAIN
/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/sys region=9999,xregion=64m
/file sysprint prt osrecfm(f) oslrecl(256)
/file myin n(assert.asm) shr
/file myout n(temp.txt) recfm(f) lrecl(80) blksize(800)
/etc new(repl) sp(100) secsp(100%)
/parm -tt dd:myin dd:myout
/load xmon
copyfile n(copyfile.lmod) lcparm v(256)
/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/sys region=9999,xregion=64m
/file sysprint prt osrecfm(f) oslrecl(256)
/file myin n(temp.txt) shr
/parm dd:myin
/load xmon
hexdump n(hexdump.lmod) lcparm v(256)
/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/sys region=9999,xregion=64m
/file sysprint prt osrecfm(f) oslrecl(256)
/load xmon
mvsendec n(mvsendec.lmod) lcparm v(256)
/END

/ID SAVE-JOB-123456 @BLD000 9999 9999 9999 9999
/PASSWORD=BLD000
/sys region=9999,xregion=64m
/file sysprint prt osrecfm(f) oslrecl(256)
/load xmon
mvsunzip n(mvsunzip.lmod) lcparm v(256)
/END
