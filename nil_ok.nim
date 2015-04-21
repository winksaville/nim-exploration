# OK: causes nil pointer exception at runtime
type
  OPtr = ptr O
  O = object
    i: int

var
  op: OPtr

op = nil
op.i = 1

