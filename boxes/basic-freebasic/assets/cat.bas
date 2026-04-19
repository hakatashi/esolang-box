Dim f As Integer
Dim s As String
f = Freefile
Open "/dev/stdin" For Input As #f
Line Input #f, s
Close #f
Print s
