//GCCGEN   JOB CLASS=C,REGION=0K
//*
//COMPARE  PROC GCCPREF='GCC',ONE='',TWO=''
//COMPR    EXEC PGM=IEBCOMPR
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=&GCCPREF..&ONE,DISP=SHR
//SYSUT2   DD DSN=&GCCPREF..&TWO,DISP=SHR
//SYSIN    DD DUMMY
//         PEND
//*
//COPY     PROC GCCPREF='GCC'
//IEBCPY   EXEC PGM=IEBCOPY
//FROM     DD DSN=&GCCPREF..TMPLOAD,DISP=SHR
//TO       DD DSN=&GCCPREF..LINKLIB,DISP=SHR
//SYSIN    DD DUMMY
//SYSPRINT DD SYSOUT=*
//         PEND
//*
//*
//*
//CMP      EXEC COMPARE,ONE='S2',TWO='S'
//SYSIN    DD *
 COMPARE TYPORG=PO
/*
//*
//CPY      EXEC COPY,COND=(4,LT)
//SYSIN    DD *
 COPY OUTDD=TO,INDD=FROM
 SELECT MEMBER=((STAGE1,GCC))
/*
//
