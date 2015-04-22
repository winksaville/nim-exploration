import macros, strutils

macro makeProcs(name: string, number: int): stmt {.immediate.} =
  ## parameter n[0] is the base name and n[1] is the
  ## number of procs to create of the form baseName & $i.
  ## So makeProcs("def", "3") creates:
  ##   proc def1() =
  ##     echo("my name=def1")
  ##   proc def2() =
  ##     echo("my name=def2")
  ##   proc def3() =
  ##     echo("my name=def3")
  var
    baseName: string = $name
    num: int = parseInt($number.toStrLit())
  echo "makeP: baseName=", baseName, " num=", num
  result = newStmtList()
  for i in 1..num:
    var
      name = newIdentNode(baseName & $i)
      procParams = [newEmptyNode()]
      procBody = newStmtList()
    procBody.add(newCall("echo", newStrLitNode("my name=" & $name)))
    result.add(newProc(name, procParams, procBody))

makeProcs(def, 3)

def1()
def2()
def3()

