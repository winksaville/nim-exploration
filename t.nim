proc hi(count: int) =
  for i in 0..count-1:
    echo ("hi " & $i)

hi(4)
