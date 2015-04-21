# Crashes compiler
type
  O = object
    i: int

var
  o: O

o = cast[O](nil)
