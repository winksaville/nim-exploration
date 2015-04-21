import macros, strutils

template makeProc(name: untyped) =
  var `name Counter` {.inject.}: int
  proc name(param: int) =
    `name Counter` += 1
    echo "param=" & $param & " counter=" & $`name Counter`


makeProc(x1)
x1(1)
x1(2)
x1(3)
echo "x1Counter=", x1Counter

makeProc(x2)
x2(4)
x2(5)
echo "x2Counter=", x2Counter

when false:
  for i in 1..3:
    makeProc(y & $i)
