//GCCGEN   JOB CLASS=C,REGION=0K
//*
//* Create a 24-bit version of the compiler, then delete
//* datasets no longer required.
//*
//LINK     PROC PDPPREF='PDPCLIB',GCCPREF='GCC',MODULE='GCC370'
//LKED     EXEC PGM=IEWL,PARM='MAP,LIST,SIZE=(999424,65536)'
//SYSUT1   DD UNIT=SYSALLDA,SPACE=(CYL,(30,10))
//SYSPRINT DD SYSOUT=*
//SYSLIB   DD DSN=&PDPPREF..NCALIB,DISP=SHR
//         DD DSN=&GCCPREF..NCALIB,DISP=SHR
//SYSLMOD  DD DSN=&GCCPREF..LINKLIB(&MODULE),DISP=SHR
//         PEND
//*
//* We keep S2, which should be identical to S3 (if it
//* exists) so that people without the compiler can
//* take the assembler code and reassemble to create
//* the load module on another system.
//*
//CLEAN    PROC GCCPREF='GCC'
//DELETE   EXEC PGM=IEFBR14
//DD9      DD DSN=&GCCPREF..S,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//DD11     DD DSN=&GCCPREF..NCALIB,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//DD15     DD DSN=&GCCPREF..S3,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//DD17     DD DSN=&GCCPREF..TMPLOAD,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//*
//         PEND
//*
//S1       EXEC LINK
//LKED.SYSLIN   DD *
 INCLUDE SYSLIB(MVSSTART)
 INCLUDE SYSLIB(START)
 INCLUDE SYSLIB(MVSSUPA)
 INCLUDE SYSLIB(STDIO)
 INCLUDE SYSLIB(STDLIB)
 INCLUDE SYSLIB(CTYPE)
 INCLUDE SYSLIB(STRING)
 INCLUDE SYSLIB(TIME)
 INCLUDE SYSLIB(ERRNO)
 INCLUDE SYSLIB(ASSERT)
 INCLUDE SYSLIB(LOCALE)
 INCLUDE SYSLIB(MATH)
 INCLUDE SYSLIB(SETJMP)
 INCLUDE SYSLIB(SIGNAL)
 INCLUDE SYSLIB(ALIAS)
 INCLUDE SYSLIB(ATTRIBS)
 INCLUDE SYSLIB(BB@REORD)
 INCLUDE SYSLIB(BITMAP)
 INCLUDE SYSLIB(BUILTINS)
 INCLUDE SYSLIB(C@AUX@IN)
 INCLUDE SYSLIB(C@COMMON)
 INCLUDE SYSLIB(C@CONVER)
 INCLUDE SYSLIB(C@DECL)
 INCLUDE SYSLIB(C@ERRORS)
 INCLUDE SYSLIB(C@FORMAT)
 INCLUDE SYSLIB(C@LANG)
 INCLUDE SYSLIB(C@LEX)
 INCLUDE SYSLIB(C@OBJC@C)
 INCLUDE SYSLIB(C@PARSE)
 INCLUDE SYSLIB(C@PRAGMA)
 INCLUDE SYSLIB(C@SEMANT)
 INCLUDE SYSLIB(C@TYPECK)
 INCLUDE SYSLIB(CALLER@S)
 INCLUDE SYSLIB(CALLS)
 INCLUDE SYSLIB(CFG)
 INCLUDE SYSLIB(CFGANAL)
 INCLUDE SYSLIB(CFGBUILD)
 INCLUDE SYSLIB(CFGCLEAN)
 INCLUDE SYSLIB(CFGLAYOU)
 INCLUDE SYSLIB(CFGLOOP)
 INCLUDE SYSLIB(CFGRTL)
 INCLUDE SYSLIB(COMBINE)
 INCLUDE SYSLIB(CONFLICT)
 INCLUDE SYSLIB(CONVERT)
 INCLUDE SYSLIB(CPPDEFAU)
 INCLUDE SYSLIB(CPPERROR)
 INCLUDE SYSLIB(CPPEXP)
 INCLUDE SYSLIB(CPPFILES)
 INCLUDE SYSLIB(CPPHASH)
 INCLUDE SYSLIB(CPPINIT)
 INCLUDE SYSLIB(CPPLEX)
 INCLUDE SYSLIB(CPPLIB)
 INCLUDE SYSLIB(CPPMACRO)
 INCLUDE SYSLIB(CPPMAIN)
 INCLUDE SYSLIB(CPPSPEC)
 INCLUDE SYSLIB(CSE)
 INCLUDE SYSLIB(CSELIB)
 INCLUDE SYSLIB(DEBUG)
 INCLUDE SYSLIB(DEPENDEN)
 INCLUDE SYSLIB(DF)
 INCLUDE SYSLIB(DIAGNOST)
 INCLUDE SYSLIB(DOMINANC)
 INCLUDE SYSLIB(DWARF2AS)
 INCLUDE SYSLIB(DWARF2OU)
 INCLUDE SYSLIB(EMIT@RTL)
 INCLUDE SYSLIB(EXCEPT)
 INCLUDE SYSLIB(EXPLOW)
 INCLUDE SYSLIB(EXPMED)
 INCLUDE SYSLIB(EXPR)
 INCLUDE SYSLIB(FINAL)
 INCLUDE SYSLIB(FLOW)
 INCLUDE SYSLIB(FOLD@CON)
 INCLUDE SYSLIB(FUNCTION)
 INCLUDE SYSLIB(GCC)
 INCLUDE SYSLIB(GCCSPEC)
 INCLUDE SYSLIB(GCSE)
 INCLUDE SYSLIB(GENRTL)
 INCLUDE SYSLIB(GGC@COMM)
 INCLUDE SYSLIB(GGC@PAGE)
 INCLUDE SYSLIB(GLOBAL)
 INCLUDE SYSLIB(GRAPH)
 INCLUDE SYSLIB(HASH)
 INCLUDE SYSLIB(HASHTABL)
 INCLUDE SYSLIB(HOOKS)
 INCLUDE SYSLIB(IFCVT)
 INCLUDE SYSLIB(INSN@ATT)
 INCLUDE SYSLIB(INSN@EMI)
 INCLUDE SYSLIB(INSN@EXT)
 INCLUDE SYSLIB(INSN@OPI)
 INCLUDE SYSLIB(INSN@OUT)
 INCLUDE SYSLIB(INSN@REC)
 INCLUDE SYSLIB(INTEGRAT)
 INCLUDE SYSLIB(JUMP)
 INCLUDE SYSLIB(LANGHOOK)
 INCLUDE SYSLIB(LCM)
 INCLUDE SYSLIB(LINE@MAP)
 INCLUDE SYSLIB(LISTS)
 INCLUDE SYSLIB(LOCAL@AL)
 INCLUDE SYSLIB(LOOP)
 INCLUDE SYSLIB(MKDEPS)
 INCLUDE SYSLIB(OPTABS)
 INCLUDE SYSLIB(PARAMS)
 INCLUDE SYSLIB(PREDICT)
 INCLUDE SYSLIB(PREFIX)
 INCLUDE SYSLIB(PRINT@RT)
 INCLUDE SYSLIB(PRINT@TR)
 INCLUDE SYSLIB(PROFILE)
 INCLUDE SYSLIB(REAL)
 INCLUDE SYSLIB(RECOG)
 INCLUDE SYSLIB(REGCLASS)
 INCLUDE SYSLIB(REGMOVE)
 INCLUDE SYSLIB(REGRENAM)
 INCLUDE SYSLIB(RELOAD)
 INCLUDE SYSLIB(RELOAD1)
 INCLUDE SYSLIB(RESOURCE)
 INCLUDE SYSLIB(RTL@ERRO)
 INCLUDE SYSLIB(RTL)
 INCLUDE SYSLIB(RTLANAL)
 INCLUDE SYSLIB(SBITMAP)
 INCLUDE SYSLIB(SIBCALL)
 INCLUDE SYSLIB(SIMPLIFY)
 INCLUDE SYSLIB(SSA@CCP)
 INCLUDE SYSLIB(SSA@DCE)
 INCLUDE SYSLIB(SSA)
 INCLUDE SYSLIB(STMT)
 INCLUDE SYSLIB(STOR@LAY)
 INCLUDE SYSLIB(STRINGPO)
 INCLUDE SYSLIB(TIMEVAR)
 INCLUDE SYSLIB(TOPLEV)
 INCLUDE SYSLIB(TREE@DUM)
 INCLUDE SYSLIB(TREE@INL)
 INCLUDE SYSLIB(TREE)
 INCLUDE SYSLIB(UNROLL)
 INCLUDE SYSLIB(VARASM)
 INCLUDE SYSLIB(VARRAY)
 INCLUDE SYSLIB(VERSION)
 INCLUDE SYSLIB(XMALLOC)
 INCLUDE SYSLIB(XSTRERRO)
 INCLUDE SYSLIB(XSTRDUP)
 INCLUDE SYSLIB(XEXIT)
 INCLUDE SYSLIB(CONCAT)
 INCLUDE SYSLIB(HEX)
 INCLUDE SYSLIB(ALLOCA)
 INCLUDE SYSLIB(LBASENAM)
 INCLUDE SYSLIB(OBSTACK)
 INCLUDE SYSLIB(STRSIGNA)
 INCLUDE SYSLIB(SAFE@CTY)
 INCLUDE SYSLIB(SPLAY@TR)
 INCLUDE SYSLIB(FIBHEAP)
 INCLUDE SYSLIB(HASHTAB)
 INCLUDE SYSLIB(ASPRINTF)
 INCLUDE SYSLIB(VASPRINT)
 INCLUDE SYSLIB(GETPAGES)
 INCLUDE SYSLIB(PARTITIO)
 INCLUDE SYSLIB(I370@C)
 INCLUDE SYSLIB(I370)
 INCLUDE SYSLIB(UNIXIO)
 ENTRY @@MAIN
/*
//*
//S2       EXEC CLEAN
//*
//
