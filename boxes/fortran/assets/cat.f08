program cat
  character(len=100) input
  read *, input
  print '(A)', trim(input)
end program cat