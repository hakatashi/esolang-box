(execute-kbd-macro (read-kbd-macro
    (with-temp-buffer
        (insert-file-contents "/tmp/code.txt")
        (buffer-string))))