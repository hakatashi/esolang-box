(module
  (memory (import "env" "memory") 1)
  (func (export "main") (result i32)
    i32.const 0
  )
  (data (i32.const 0)
    "Hello, World!\00"
  )
)
