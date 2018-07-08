proc pascal*(n,m: int): int64 {.exportc: "pascal", varargs.} =
  if m == 0 or m == n : 1'i64
  else: pascal(n-1,m-1) + pascal(n-1,m)
