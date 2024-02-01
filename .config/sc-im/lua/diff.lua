local first = sc.lgetnum(0, sc.currow())
local last = sc.lgetnum(0, sc.currow() + 1)

sc.lsetnum(sc.curcol(), sc.currow(), (first - last) / 60)


