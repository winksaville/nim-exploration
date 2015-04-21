template suite*(name: string, suiteBody: stmt): stmt {.immediate.} =
  type
    TestObj {.inject.} = object
      i: int

  proc newTestObj(param: int): TestObj =
    result.i = param

  block:
    template test(s: string, count: int, testBody: stmt): stmt {.immediate.} =
      block:
        var to {.inject.} = newTestObj(count)
        testBody
        #return to

    #template test(s: string, testBody: stmt): stmt {.immediate.}  =
    #  test(s, 0, testBody)

    suiteBody

#template suite*(suiteBody: stmt): stmt {.immediate.} =
#    suite("name", suiteBody)

suite "s1":
  var myTo = newTestObj(3)

  test "123", 123:
    echo "to=", to

  echo "myTo=", myTo

  #test "abc":
  #  echo "to.i=", to.i

#suite:
#  echo "yo"

var gTo = newTestObj(456)
echo "gTo=", gTo
