declare i32 @puts(i8*)
declare i32 @gets(i8*)
define i32 @main() {
  %1 = alloca i8, align 1
  call i32 @gets(i8* %1)
  call i32 @puts(i8* %1)
  ret i32 0
}
