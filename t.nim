# try expression
let x: int =
  try:
    discard open("t.nimx")
    echo("exists")
    0 # ok path
  except:
    let em = getCurrentExceptionMsg()
    echo("em=",em)
    -1 # error path
  finally: echo "yo"

echo "x=",$x

# Stack object and construction
type StackObject = object
  f1: int

var so = StackObject(f1: 4)
echo("so=",so)

# Heap object and construction
type HeapObject = ref object # not "ref" for heap objects
  f1: int

# Constructor with optional default value
proc newHeapObject(f1p: int = 3): HeapObject =
  result = HeapObject(f1: f1p)

# direct construction
var ho = HeapObject(f1: 5)
echo("ho=",ho[])

# Use constructor with a default f1 parameter
var hox = newHeapObject()
echo("hox=",hox[])

# Use constructor but override the default
var hoy = newHeapObject(7)
echo("hoy=",hoy[])


# reading a file a line at a time with try/except/finally
try:
  var f = open("t.nim")
  block:
    try:
      var line: string
      line = f.readline()
      echo "line=", line
      echo "echo done"
    except IOError:
      echo "IOError reading"
    except:
      echo "Uknknown exception"
    finally:
      echo "closing"
      close f
      echo "closed"
except IOError:
  echo "IOError"
finally:
  echo "done"

# Iterator
iterator things(a: string): string =
  if a == nil:
    yield "<nil>"
  elif a == "":
    yield "<empty>"
  else:
    var i = 0
    while i < (a.len() - 1):
      var s = a[i] & a[i+1]
      yield s
      i += 2
    if i < a.len():
      yield $a[i]

var
  nilStr: string
  emptyStr: string = ""
  len1Str: string = "1"
  len2Str: string = "12"
  len3Str: string = "123"

for s in things(nilStr):
  echo s
  
for s in things(emptyStr):
  echo s

for s in things(len1Str):
  echo s

for s in things(len2Str):
  echo s

for s in things(len3Str):
  stdout.write s # no EOL
stdout.write "\n"

# simple for loop
proc hi(count: int) =
  for i in 1..count:
    echo ("hi " & $i)

proc two(): int =
  2

hi(two())

# local scope rules
if (let m = 2 + 2; m == 3):
  echo "m == 3"
elif (let m = 3 + 4; m == 6):
  echo "m == 6"
else:
  echo "help"

# conditional compiliation
when 1 == 1:
  echo "ok"
elif 2 != 2:
  shit here ; ddf d;d asf4

