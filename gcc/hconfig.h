#include "config.h"
#include "auto-host.h"
#ifdef IN_GCC
/* Provide three core typedefs used by everything, if we are compiling
   GCC.  These used to be found in rtl.h and tree.h, but this is no
   longer practical.  Providing these here rather that system.h allows
   the typedefs to be used everywhere within GCC. */
#ifndef RTX_FORWARD
#define RTX_FORWARD 1
struct rtx_def;
typedef struct rtx_def *rtx;
struct rtvec_def;
typedef struct rtvec_def *rtvec;
union tree_node;
typedef union tree_node *tree;
#endif
#endif
#ifdef IN_GCC
# include "ansidecl.h"
/*# include "i386/xm-cygwin.h"*/
/*#include "xm-mvs.h"*/
# include "mvspdp.h"
# include "i370.h"
# include "defaults.h"
#endif
#ifndef POSIX
# define POSIX
#endif
