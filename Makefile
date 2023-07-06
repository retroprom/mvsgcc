# Custom makefile for MVSGCC

# Configuration
PREFIX ?= /usr/local

# Common definitions
DEFINES = -DIN_GCC -DHAVE_CONFIG_H -DPUREISO
INCLUDES = -Iinclude -Igcc -Igcc/config/i370
LANGUAGE = -std=c99 -pedantic

# Definitions for building host programs
HOST_CC = gcc
# TODO must build with -m32 -O0 on modern compilers
HOST_CFLAGS = $(LANGUAGE) -g -m32 -O0 $(INCLUDES) $(DEFINES) -DMVSGCC_CROSS

# Definitions for building target programs
TARGET_INCLUDES = -I../mvsclib/common/include -I../mvsclib/mvs/include
TARGET_CFLAGS = $(LANGUAGE) -Os $(TARGET_INCLUDES) $(INCLUDES) $(DEFINES)

# Definitions for each platform
MVS_CFLAGS = $(TARGET_CFLAGS) -DTARGET_MVS
MVS_TARGET = i370-mvs
CMS_CFLAGS = $(TARGET_CFLAGS) -DTARGET_CMS
CMS_TARGET = i370-cms
VSE_CFLAGS = $(TARGET_CFLAGS) -DTARGET_VSE
VSE_TARGET = i370-vse

# Sources for the compiler
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

# Sources for libiberty
LIBERTY_SRCS = \
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

# All sources for the compiler
ALL_GCC_SRCS = $(GCC_SRCS) $(LIBERTY_SRCS)

# Default rule
all: all-cross
.PHONY: all
all-cross: mvs-cross cms-cross vse-cross
.PHONY: all-cross
all-target: mvs-target
.PHONY: all-target

# Install rule
install: install-cross install-target
.PHONY: install
install-cross:
.PHONY: install-cross
install-target:
.PHONY: install-target

# Cleanup rule
clean:
	rm -rf out
.PHONY: clean

# Targets for cross compilers
mvs-cross: out/i370-mvs-gcc
.PHONY: mvs-cross
cms-cross: out/i370-cms-gcc
.PHONY: cms-cross
vse-cross: out/i370-vse-gcc
.PHONY: vse-cross

# Targets for target compilers
mvs-target: mvs-cross i370-mvs-target-asm
.PHONY: mvs-target
cms-target: cms-cross i370-cms-target-asm
.PHONY: cms-target
vse-target: vse-cross i370-vse-target-asm
.PHONY: vse-target

# Dummy rule to prevent running yacc
gcc/c-parse.c: gcc/c-parse.y
	touch $@

# Rule for building a cross object
define build_cross_object
out/$(1)-cross/$(notdir $(3:.c=.o)): $(3)
	@mkdir -p out/$(1)-cross
	$(HOST_CC) $(2) -c -o $$@ $$<

endef

# Rule for building a cross compiler
define build_cross
# build each source file
$(foreach src,$(3),$(call build_cross_object,$(1),$(2),$(src)))
# build the cross compiler binary
out/$(1)-gcc: $(foreach src,$(3),out/$(1)-cross/$(notdir $(src:.c=.o)))
	$(HOST_CC) $(2) -o $$@ $$?

endef

# Rule for building a target file
define build_target_object
out/$(1)-target/$(notdir $(3:.c=.asm)): $(3) out/$(1)-gcc
	@mkdir -p out/$(1)-target
	out/$(1)-gcc $(2) -S -o $$@ $$<

endef

# Rule for building a target compiler
define build_target
# build each source file
$(foreach src,$(3),$(call build_target_object,$(1),$(2),$(src)))
# build asm files for the compiler
$(1)-target-asm: $(foreach src,$(3),out/$(1)-target/$(notdir $(src:.c=.asm)))
	@echo DONE
.PHONY: $(1)-target-asm

endef

# Define cross compilers
$(eval $(call build_cross,$(MVS_TARGET),$(HOST_CFLAGS) -DTARGET_MVS,$(ALL_GCC_SRCS)))
$(eval $(call build_cross,$(CMS_TARGET),$(HOST_CFLAGS) -DTARGET_CMS,$(ALL_GCC_SRCS)))
$(eval $(call build_cross,$(VSE_TARGET),$(HOST_CFLAGS) -DTARGET_VSE,$(ALL_GCC_SRCS)))

# Define target compilers
$(eval $(call build_target,$(MVS_TARGET),$(MVS_CFLAGS),$(ALL_GCC_SRCS)))
$(eval $(call build_target,$(CMS_TARGET),$(CMS_CFLAGS),$(ALL_GCC_SRCS)))
$(eval $(call build_target,$(VSE_TARGET),$(VSE_CFLAGS),$(ALL_GCC_SRCS)))
