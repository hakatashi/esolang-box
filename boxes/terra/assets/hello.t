local C = terralib.includec("stdio.h")
terra main()
    C.printf("Hello, World!\n")
end
main()
