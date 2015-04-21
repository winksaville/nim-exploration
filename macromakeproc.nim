import macros, strutils

macro makeProc(n: varargs[expr]): stmt =
  ## Works to create a proc as we see below
  ## abc1() is invokable
  echo "makeProc: n.len=", n.len
  for i in 0..n.len-1:
    echo "makeProc: n[" & $i & "]=" & $n[i]
  var
    name = newIdentNode($n[0] & $n[1])
    procParams = [newEmptyNode()]
    procBody = newStmtList()
  procBody.add(newCall("echo", newStrLitNode("hi")))

  result = newProc(name, procParams, procBody)

makeProc("abc", "1")

abc1()

macro makeProcs(n: varargs[expr]): stmt =
  ## But this doesn't work the invocation of makeProc
  ## happens at parse not invocation so abc2 and abc3
  ## are never created
  echo "makeProcs: n.len=", n.len
  for i in 0..n.len-1:
    var s: string = $n[i]
    echo "makeProcs: n[" & $i & "]=" & s
    makeProc("def", s)

makeProcs("2", "3")

when false:
  def2()
  def3()

macro makeP(n: varargs[expr]): stmt =
  ## But this does work using a single macro with two
  ## parameters n[0] is the base name and n[1] is the
  ## number to create of the form baseName & $i.
  var
    baseName: string = $n[0]
    num: int = parseInt($n[1])
  echo "makeP: n.len=", n.len, " baseName=", baseName, " num=", num
  result = newStmtList()
  for i in 0..num-1:
    var
      name = newIdentNode(baseName & $i)
      procParams = [newEmptyNode()]
      procBody = newStmtList()
    procBody.add(newCall("echo", newStrLitNode("my name=" & $name)))
    result.add(newProc(name, procParams, procBody))

makeP("def", "3")

def0()
def1()
def2()

