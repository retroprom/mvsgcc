del alljcl.jcl
type stage0a.jcl >>alljcl.jcl
type stage0b.jcl >>alljcl.jcl
type stage0c.jcl >>alljcl.jcl
type stage0d.jcl >>alljcl.jcl
type stage1a.jcl >>alljcl.jcl
type stage1b_pdos.jcl >>alljcl.jcl
type stage4z.jcl >>alljcl.jcl
type stage5b.jcl >>alljcl.jcl
type stage5_pdos.jcl >>alljcl.jcl
call runmvs alljcl.jcl output.txt all.zip gccpdos.zip
