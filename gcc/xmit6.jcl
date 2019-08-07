//GCCGEN   JOB CLASS=C,REGION=0K
//*
//* Preallocate all target PDSes.
//* Then receive all the XMITs in the XMIT PDS.
//* Adjust the HLQs appropriately.
//*
//CREATE   PROC PDPPREF='PDPCLIB',GCCPREF='GCC'
//DELETE   EXEC PGM=IEFBR14
//DD1      DD DSN=&PDPPREF..INCLUDE,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//DD2      DD DSN=&PDPPREF..SOURCE,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//DD3      DD DSN=&PDPPREF..DOC,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//DD4      DD DSN=&GCCPREF..PROCLIB,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//DD5      DD DSN=&GCCPREF..SOURCE,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//DD6      DD DSN=&GCCPREF..INCLUDE,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//DD7      DD DSN=&GCCPREF..DOC,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//DD8      DD DSN=&GCCPREF..JCL,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//DD10     DD DSN=&GCCPREF..LINKLIB,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//DD12     DD DSN=&PDPPREF..NCALIB,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//DD13     DD DSN=&PDPPREF..MACLIB,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//DD14     DD DSN=&GCCPREF..S2,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//DD16     DD DSN=&PDPPREF..LINKLIB,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//*
//ALLOC    EXEC PGM=IEFBR14
//DD1      DD DSN=&PDPPREF..INCLUDE,DISP=(,CATLG),
// DCB=(RECFM=VB,LRECL=255,BLKSIZE=6233),
// SPACE=(6233,(23,23,44)),UNIT=SYSALLDA
//DD2      DD DSN=&PDPPREF..SOURCE,DISP=(,CATLG),
// DCB=(RECFM=FB,LRECL=80,BLKSIZE=6160),
// SPACE=(6160,(320,320,44)),UNIT=SYSALLDA
//DD3      DD DSN=&PDPPREF..DOC,DISP=(,CATLG),
// DCB=(RECFM=FB,LRECL=80,BLKSIZE=6160),
// SPACE=(6160,(23,23,44)),UNIT=SYSALLDA
//DD4      DD DSN=&GCCPREF..PROCLIB,DISP=(,CATLG),
// DCB=(RECFM=FB,LRECL=80,BLKSIZE=6160),
// SPACE=(6160,(15,15,44)),UNIT=SYSALLDA
//DD5      DD DSN=&GCCPREF..SOURCE,DISP=(,CATLG),
// DCB=(RECFM=VB,LRECL=255,BLKSIZE=6233),
// SPACE=(6233,(2600,2600,44)),UNIT=SYSALLDA
//DD6      DD DSN=&GCCPREF..INCLUDE,DISP=(,CATLG),
// DCB=(RECFM=VB,LRECL=255,BLKSIZE=6233),
// SPACE=(6233,(346,346,44)),UNIT=SYSALLDA
//DD7      DD DSN=&GCCPREF..DOC,DISP=(,CATLG),
// DCB=(RECFM=VB,LRECL=255,BLKSIZE=6233),
// SPACE=(6233,(100,100,44)),UNIT=SYSALLDA
//DD8      DD DSN=&GCCPREF..JCL,DISP=(,CATLG),
// DCB=(RECFM=FB,LRECL=80,BLKSIZE=6160),
// SPACE=(6160,(69,69,44)),UNIT=SYSALLDA
//DD10     DD DSN=&GCCPREF..LINKLIB,DISP=(,CATLG),
// DCB=(RECFM=U,LRECL=0,BLKSIZE=6144),
// SPACE=(6144,(1548,1548,44),,,ROUND),UNIT=SYSALLDA
//DD12     DD DSN=&PDPPREF..NCALIB,DISP=(,CATLG),
// DCB=(RECFM=U,LRECL=0,BLKSIZE=6144),
// SPACE=(6144,(61,61,44)),UNIT=SYSALLDA
//DD13     DD DSN=&PDPPREF..MACLIB,DISP=(,CATLG),
// DCB=(RECFM=FB,LRECL=80,BLKSIZE=6160),
// SPACE=(6160,(10,10,44)),UNIT=SYSALLDA
//DD14     DD DSN=&GCCPREF..S2,DISP=(,CATLG),
// DCB=(RECFM=FB,LRECL=80,BLKSIZE=6160),
// SPACE=(6160,(10500,10500,44)),UNIT=SYSALLDA
//DD16     DD DSN=&PDPPREF..LINKLIB,DISP=(,CATLG),
// DCB=(RECFM=U,LRECL=0,BLKSIZE=6144),
// SPACE=(6144,(77,77,44),,,ROUND),UNIT=SYSALLDA
//         PEND
//*
//RECV2    PROC
//*
//RECV     EXEC PGM=IKJEFT01,DYNAMNBR=60
//SYSTSPRT DD  SYSOUT=*
//SYSPRINT DD  SYSOUT=*,DCB=(RECFM=FB,LRECL=121,BLKSIZE=12100)
//SYSTERM  DD  SYSOUT=*
//SYSABEND DD  SYSOUT=*
//SYSIN    DD  DUMMY
//*
//         PEND
//*
//* Preallocate all datasets
//S1 EXEC CREATE
//*
//* Now "receive" into those preallocated datasets, using
//* the dataset substitutions below.
//S2 EXEC RECV2
//* Note that if you are trying to install this under your
//* own userid, or otherwise need multiple levels of dataset
//* name prefixes, you will need more than the profile prefix
//* to get to the right names. You will need to manually
//* specify the target dataset name. So on each of those
//* blank lines you will need something like:
//* DA('ABC.DEF.GCC.DOC').
//* For your convenience, a second send of RECEIVE commands
//* is included below in a DD statement that is not used.
//* If you change that DD to SYSTSIN and rename the existing
//* SYSTSIN to "UNUSED", it should work (on a z/OS system,
//* anyway).
//SYSTSIN  DD  *
PROFILE PREFIX(GCC)
RECEIVE INDSNAME('GCC.GCC.PDS.XMIT(GCCDOC)')

RECEIVE INDSNAME('GCC.GCC.PDS.XMIT(GCCJCL)')

RECEIVE INDSNAME('GCC.GCC.PDS.XMIT(GCCLINK)')

RECEIVE INDSNAME('GCC.GCC.PDS.XMIT(GCCPROC)')

RECEIVE INDSNAME('GCC.GCC.PDS.XMIT(GCCS2)')

RECEIVE INDSNAME('GCC.GCC.PDS.XMIT(GCCSRC)')

RECEIVE INDSNAME('GCC.GCC.PDS.XMIT(GCCINC)')

PROFILE PREFIX(PDPCLIB)
RECEIVE INDSNAME('GCC.GCC.PDS.XMIT(PDPDOC)')

RECEIVE INDSNAME('GCC.GCC.PDS.XMIT(PDPINC)')

RECEIVE INDSNAME('GCC.GCC.PDS.XMIT(PDPMAC)')

RECEIVE INDSNAME('GCC.GCC.PDS.XMIT(PDPNCAL)')

RECEIVE INDSNAME('GCC.GCC.PDS.XMIT(PDPLINK)')

RECEIVE INDSNAME('GCC.GCC.PDS.XMIT(PDPSRC)')

LISTC LEVEL(GCC)
LISTC LEVEL(PDPCLIB)
/*
//*
//* Rename this from UNUSED to SYSTSIN if this is more
//* suitable for your use. Make sure you rename the other
//* one from SYSTSIN to UNUSED if you do so though!
//UNUSED   DD  *
RECEIVE INDSNAME('ABC.DEF.GCC.GCC.PDS.XMIT(GCCDOC)')
DA('ABC.DEF.GCC.DOC')
RECEIVE INDSNAME('ABC.DEF.GCC.GCC.PDS.XMIT(GCCJCL)')
DA('ABC.DEF.GCC.JCL')
RECEIVE INDSNAME('ABC.DEF.GCC.GCC.PDS.XMIT(GCCLINK)')
DA('ABC.DEF.GCC.LINKLIB')
RECEIVE INDSNAME('ABC.DEF.GCC.GCC.PDS.XMIT(GCCPROC)')
DA('ABC.DEF.GCC.PROCLIB')
RECEIVE INDSNAME('ABC.DEF.GCC.GCC.PDS.XMIT(GCCS2)')
DA('ABC.DEF.GCC.S2')
RECEIVE INDSNAME('ABC.DEF.GCC.GCC.PDS.XMIT(GCCSRC)')
DA('ABC.DEF.GCC.SOURCE')
RECEIVE INDSNAME('ABC.DEF.GCC.GCC.PDS.XMIT(GCCINC)')
DA('ABC.DEF.GCC.INCLUDE')
RECEIVE INDSNAME('ABC.DEF.GCC.GCC.PDS.XMIT(PDPDOC)')
DA('ABC.DEF.PDPCLIB.DOC')
RECEIVE INDSNAME('ABC.DEF.GCC.GCC.PDS.XMIT(PDPINC)')
DA('ABC.DEF.PDPCLIB.INCLUDE')
RECEIVE INDSNAME('ABC.DEF.GCC.GCC.PDS.XMIT(PDPMAC)')
DA('ABC.DEF.PDPCLIB.MACLIB')
RECEIVE INDSNAME('ABC.DEF.GCC.GCC.PDS.XMIT(PDPNCAL)')
DA('ABC.DEF.PDPCLIB.NCALIB')
RECEIVE INDSNAME('ABC.DEF.GCC.GCC.PDS.XMIT(PDPLINK)')
DA('ABC.DEF.PDPCLIB.LINKLIB')
RECEIVE INDSNAME('ABC.DEF.GCC.GCC.PDS.XMIT(PDPSRC)')
DA('ABC.DEF.PDPCLIB.SOURCE')
LISTC LEVEL(ABC.DEF.GCC)
LISTC LEVEL(ABC.DEF.PDPCLIB)
/*
//*
//
