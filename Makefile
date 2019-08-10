
DEFINES = -DIN_GCC -DHAVE_CONFIG_H -DPUREISO -DMVSGCC_CROSS
INCLUDES = -I include -I gcc -I gcc/config/i370

CC = gcc
CFLAGS = -std=c99 -m32 -g -O2 -pedantic $(DEFINES) $(INCLUDES)

# sources for the compiler
GCC_SRCS= \
  gcc/alias.c \
  gcc/attribs.c \
  gcc/bb-reorder.c \
  gcc/bitmap.c \
  gcc/builtins.c \
  gcc/c-aux-info.c \
  gcc/c-common.c \
  gcc/c-convert.c \
  gcc/c-decl.c \
  gcc/c-errors.c \
  gcc/c-format.c \
  gcc/c-lang.c \
  gcc/c-lex.c \
  gcc/c-objc-common.c \
  gcc/c-parse.c \
  gcc/c-pragma.c \
  gcc/c-semantics.c \
  gcc/c-typeck.c \
  gcc/caller-save.c \
  gcc/calls.c \
  gcc/cfg.c \
  gcc/cfganal.c \
  gcc/cfgbuild.c \
  gcc/cfgcleanup.c \
  gcc/cfglayout.c \
  gcc/cfgloop.c \
  gcc/cfgrtl.c \
  gcc/combine.c \
  gcc/conflict.c \
  gcc/convert.c \
  gcc/cppdefault.c \
  gcc/cpperror.c \
  gcc/cppexp.c \
  gcc/cppfiles.c \
  gcc/cpphash.c \
  gcc/cppinit.c \
  gcc/cpplex.c \
  gcc/cpplib.c \
  gcc/cppmacro.c \
  gcc/cppmain.c \
  gcc/cppspec.c \
  gcc/cse.c \
  gcc/cselib.c \
  gcc/debug.c \
  gcc/dependence.c \
  gcc/df.c \
  gcc/diagnostic.c \
  gcc/dominance.c \
  gcc/dwarf2asm.c \
  gcc/dwarf2out.c \
  gcc/emit-rtl.c \
  gcc/except.c \
  gcc/explow.c \
  gcc/expmed.c \
  gcc/expr.c \
  gcc/final.c \
  gcc/flow.c \
  gcc/fold-const.c \
  gcc/function.c \
  gcc/gcc.c \
  gcc/gccspec.c \
  gcc/gcse.c \
  gcc/genrtl.c \
  gcc/ggc-common.c \
  gcc/ggc-page.c \
  gcc/global.c \
  gcc/graph.c \
  gcc/hash.c \
  gcc/hashtable.c \
  gcc/hooks.c \
  gcc/ifcvt.c \
  gcc/insn-attrtab.c \
  gcc/insn-emit.c \
  gcc/insn-extract.c \
  gcc/insn-opinit.c \
  gcc/insn-output.c \
  gcc/insn-recog.c \
  gcc/integrate.c \
  gcc/jump.c \
  gcc/langhooks.c \
  gcc/lcm.c \
  gcc/line-map.c \
  gcc/lists.c \
  gcc/local-alloc.c \
  gcc/loop.c \
  gcc/mkdeps.c \
  gcc/optabs.c \
  gcc/params.c \
  gcc/predict.c \
  gcc/prefix.c \
  gcc/print-rtl.c \
  gcc/print-tree.c \
  gcc/profile.c \
  gcc/real.c \
  gcc/recog.c \
  gcc/regclass.c \
  gcc/regmove.c \
  gcc/regrename.c \
  gcc/reload.c \
  gcc/reload1.c \
  gcc/resource.c \
  gcc/rtl-error.c \
  gcc/rtl.c \
  gcc/rtlanal.c \
  gcc/sbitmap.c \
  gcc/sibcall.c \
  gcc/simplify-rtx.c \
  gcc/ssa-ccp.c \
  gcc/ssa-dce.c \
  gcc/ssa.c \
  gcc/stmt.c \
  gcc/stor-layout.c \
  gcc/stringpool.c \
  gcc/timevar.c \
  gcc/toplev.c \
  gcc/tree-dump.c \
  gcc/tree-inline.c \
  gcc/tree.c \
  gcc/unroll.c \
  gcc/varasm.c \
  gcc/varray.c \
  gcc/version.c \
  gcc/config/i370/i370-c.c \
  gcc/config/i370/i370.c

# sources for libiberty
IBERTY_SRCS = \
  libiberty/xmalloc.c \
  libiberty/xstrerror.c \
  libiberty/xstrdup.c \
  libiberty/xexit.c \
  libiberty/concat.c \
  libiberty/hex.c \
  libiberty/alloca.c \
  libiberty/lbasename.c \
  libiberty/obstack.c \
  libiberty/safe-ctype.c \
  libiberty/splay-tree.c \
  libiberty/fibheap.c \
  libiberty/hashtab.c \
  libiberty/asprintf.c \
  libiberty/vasprintf.c \
  libiberty/getpagesize.c \
  libiberty/partition.c

# derive list of object files
GCC_OBJS=$(GCC_SRCS:.c=.o)
IBERTY_OBJS=$(IBERTY_SRCS:.c=.o)

# default target
default: gccmvs

gccmvs: $(GCC_OBJS) $(IBERTY_OBJS)
	$(CC) $(CFLAGS) -o $@ $?

# clean target
clean:
	rm -f gccmvs $(GCC_OBJS) $(IBERTY_OBJS)
.PHONY: clean

