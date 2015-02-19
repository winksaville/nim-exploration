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

proc hi(count: int) =
  for i in 1..count:
    echo ("hi " & $i)

proc two(): int =
  2

hi(two())

if (let m = 2 + 2; m == 3):
  echo "m == 3"
elif (let m = 3 + 4; m == 6):
  echo "m == 6"
else:
  echo "help"

when 1 == 1:
  echo "ok"
elif 2 != 2:
  shit here ; ddf d;d asf4

