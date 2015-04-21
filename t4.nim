template suite*(str: string, body: stmt): string {.immediate.} =
  block:
    var result {.inject.} = str
    body
    result

var s: string

s = suite("hello ", result &= "world")
echo "s=", s
s = suite "hello ":
  result &= "wink"
echo "s=", s
