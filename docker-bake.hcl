# This file is auto-generated from boxes/*/box.yaml. Please don't edit directly.

group "default" {
  targets = ["base", "awk", "ballerina", "build-base", "3var", "adjust", "aheui", "alphabeta", "apl", "axo", "bash-pure", "bash-busybox", "beatnik", "befunge93", "befunge98", "seed", "blc", "braille", "c-gcc", "clisp-sbcl", "cobol", "codemania", "cubically", "cyclicbrainfuck", "dis", "dotnet-base", "csharp-dotnet", "fsharp-dotnet", "visualbasic-dotnet", "doubleplusungood", "fetlang", "fish-shell-pure", "fortran", "glass", "goruby", "hanoi_stack", "intercal", "lazyk", "llvm-ir", "lolcode", "make", "malbolge", "minus", "multi-reader", "olang", "osecpu", "osecpu-aska", "piet", "python1", "python2", "aubergine", "brainfuck-esotope", "fernando", "gs2", "haystack", "i4004asm", "logicode", "minimal2d", "path", "recurse", "snusp", "stuck", "suzy", "unicat", "unreadable", "zombie", "r-language", "rail", "rapira", "rescript", "ring", "ruby", "alice", "arithmetic", "brainfuck-esomer", "copos-rb", "cy", "golfish", "golfscript", "hexagony", "labyrinth", "pxem", "pyramid-scheme", "reversed-c", "ruby-trunk", "stackcats", "standback", "starry", "typhon", "vim", "autovim", "v-vim", "wake", "ruby1", "grass", "modanshogi", "ppap", "rust", "sceql", "simula", "snobol", "snowman", "spl", "streem", "taxi", "tcl", "unlambda", "verilog", "vlang", "wat", "wierd", "wordcpu", "wren", "zsh-pure", "cmd", "csharp", "bubble-sort", "classic-music-theory", "function2d", "produire", "z80", "erlang", "elixir", "05ab1e", "ffmpeg", "gnuplot", "golang", "braintwist", "tsp", "haskell", "whitespace", "java", "arnoidc", "cjam", "convex", "evil", "floater", "js-rhino", "kotlin", "whenever", "xslt", "jq", "lua", "rprogn", "m4", "node", "beam", "calc", "canvas", "compile-time-typescript", "cubix", "emojifunge", "floating", "hakerh-base", "encapsulation", "functional", "seclusion", "serenity", "transceternal", "htms", "japt", "maybelater", "nadesiko", "nuts", "qlb", "stop", "tetris", "unicue", "wenyan", "wysiscript", "ocaml", "coq", "octave", "matl", "perl", "element", "slashes", "perl6", "php", "irc", "python3", "2sable", "arcyou", "asciidots", "backhand", "bots", "cardinal", "emoji", "exchangeif", "ezhil", "ffb", "fish", "gaia", "hbcht", "hypertorus", "iwashi", "jelly", "jellyfish", "mao", "mines", "picfunge", "pure-folders", "triangularity", "ubergenes", "width", "zucchini", "racket", "sed", "zig", "brainfuck-bfi", "ubuntu-base", "abc", "ada", "apache2-rewrite", "cpp-clang", "cpp-compile-time-clang", "crystal", "csound", "d-dmd", "d-gdc", "ed", "egison", "emojicode", "fugue", "imagemagick", "moo", "nim-lang", "powershell", "sqlite3", "swift", "tex", "bibtex", "x86asm-nasm"]
}

target "base" {
  context = "boxes/base"
  tags = ["esolang/base:latest", "esolang/base:2.4.0"]
}

target "awk" {
  context = "boxes/awk"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/awk:latest", "esolang/awk:2.4.0"]
}

target "ballerina" {
  context = "boxes/ballerina"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/ballerina:latest", "esolang/ballerina:2.4.0"]
}

target "build-base" {
  context = "boxes/build-base"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/build-base:latest", "esolang/build-base:2.4.0"]
}

target "3var" {
  context = "boxes/3var"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/3var:latest", "esolang/3var:2.4.0"]
}

target "adjust" {
  context = "boxes/adjust"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/adjust:latest", "esolang/adjust:2.4.0"]
}

target "aheui" {
  context = "boxes/aheui"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/aheui:latest", "esolang/aheui:2.4.0"]
}

target "alphabeta" {
  context = "boxes/alphabeta"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/alphabeta:latest", "esolang/alphabeta:2.4.0"]
}

target "apl" {
  context = "boxes/apl"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/apl:latest", "esolang/apl:2.4.0"]
}

target "axo" {
  context = "boxes/axo"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/axo:latest", "esolang/axo:2.4.0"]
}

target "bash-pure" {
  context = "boxes/bash-pure"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/bash-pure:latest", "esolang/bash-pure:2.4.0"]
}

target "bash-busybox" {
  context = "boxes/bash-busybox"
  contexts = {
    "esolang/bash-pure" = "target:bash-pure"
  }
  tags = ["esolang/bash-busybox:latest", "esolang/bash-busybox:2.4.0"]
}

target "beatnik" {
  context = "boxes/beatnik"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/beatnik:latest", "esolang/beatnik:2.4.0"]
}

target "befunge93" {
  context = "boxes/befunge93"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/befunge93:latest", "esolang/befunge93:2.4.0"]
}

target "befunge98" {
  context = "boxes/befunge98"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/befunge98:latest", "esolang/befunge98:2.4.0"]
}

target "seed" {
  context = "boxes/seed"
  contexts = {
    "esolang/befunge98" = "target:befunge98"
  }
  tags = ["esolang/seed:latest", "esolang/seed:2.4.0"]
}

target "blc" {
  context = "boxes/blc"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/blc:latest", "esolang/blc:2.4.0"]
}

target "braille" {
  context = "boxes/braille"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/braille:latest", "esolang/braille:2.4.0"]
}

target "brainfuck-moratorium" {
  context = "boxes/brainfuck-moratorium"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/brainfuck-moratorium:latest", "esolang/brainfuck-moratorium:2.4.0"]
}

target "c-gcc" {
  context = "boxes/c-gcc"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/c-gcc:latest", "esolang/c-gcc:2.4.0"]
}

target "clisp-sbcl" {
  context = "boxes/clisp-sbcl"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/clisp-sbcl:latest", "esolang/clisp-sbcl:2.4.0"]
}

target "cmm" {
  context = "boxes/cmm"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/cmm:latest", "esolang/cmm:2.4.0"]
}

target "cobol" {
  context = "boxes/cobol"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/cobol:latest", "esolang/cobol:2.4.0"]
}

target "codemania" {
  context = "boxes/codemania"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/codemania:latest", "esolang/codemania:2.4.0"]
}

target "cubically" {
  context = "boxes/cubically"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/cubically:latest", "esolang/cubically:2.4.0"]
}

target "cyclicbrainfuck" {
  context = "boxes/cyclicbrainfuck"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/cyclicbrainfuck:latest", "esolang/cyclicbrainfuck:2.4.0"]
}

target "dis" {
  context = "boxes/dis"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/dis:latest", "esolang/dis:2.4.0"]
}

target "dotnet-base" {
  context = "boxes/dotnet-base"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/dotnet-base:latest", "esolang/dotnet-base:2.4.0"]
}

target "csharp-dotnet" {
  context = "boxes/csharp-dotnet"
  contexts = {
    "esolang/dotnet-base" = "target:dotnet-base"
  }
  tags = ["esolang/csharp-dotnet:latest", "esolang/csharp-dotnet:2.4.0"]
}

target "fsharp-dotnet" {
  context = "boxes/fsharp-dotnet"
  contexts = {
    "esolang/dotnet-base" = "target:dotnet-base"
  }
  tags = ["esolang/fsharp-dotnet:latest", "esolang/fsharp-dotnet:2.4.0"]
}

target "visualbasic-dotnet" {
  context = "boxes/visualbasic-dotnet"
  contexts = {
    "esolang/dotnet-base" = "target:dotnet-base"
  }
  tags = ["esolang/visualbasic-dotnet:latest", "esolang/visualbasic-dotnet:2.4.0"]
}

target "doubleplusungood" {
  context = "boxes/doubleplusungood"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/doubleplusungood:latest", "esolang/doubleplusungood:2.4.0"]
}

target "fetlang" {
  context = "boxes/fetlang"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/fetlang:latest", "esolang/fetlang:2.4.0"]
}

target "fish-shell-pure" {
  context = "boxes/fish-shell-pure"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/fish-shell-pure:latest", "esolang/fish-shell-pure:2.4.0"]
}

target "fortran" {
  context = "boxes/fortran"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/fortran:latest", "esolang/fortran:2.4.0"]
}

target "glass" {
  context = "boxes/glass"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/glass:latest", "esolang/glass:2.4.0"]
}

target "goruby" {
  context = "boxes/goruby"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/goruby:latest", "esolang/goruby:2.4.0"]
}

target "hanoi_stack" {
  context = "boxes/hanoi_stack"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/hanoi_stack:latest", "esolang/hanoi_stack:2.4.0"]
}

target "intercal" {
  context = "boxes/intercal"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/intercal:latest", "esolang/intercal:2.4.0"]
}

target "lazyk" {
  context = "boxes/lazyk"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/lazyk:latest", "esolang/lazyk:2.4.0"]
}

target "llvm-ir" {
  context = "boxes/llvm-ir"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/llvm-ir:latest", "esolang/llvm-ir:2.4.0"]
}

target "lolcode" {
  context = "boxes/lolcode"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/lolcode:latest", "esolang/lolcode:2.4.0"]
}

target "make" {
  context = "boxes/make"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/make:latest", "esolang/make:2.4.0"]
}

target "malbolge" {
  context = "boxes/malbolge"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/malbolge:latest", "esolang/malbolge:2.4.0"]
}

target "minus" {
  context = "boxes/minus"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/minus:latest", "esolang/minus:2.4.0"]
}

target "multi-reader" {
  context = "boxes/multi-reader"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/multi-reader:latest", "esolang/multi-reader:2.4.0"]
}

target "olang" {
  context = "boxes/olang"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/olang:latest", "esolang/olang:2.4.0"]
}

target "osecpu" {
  context = "boxes/osecpu"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/osecpu:latest", "esolang/osecpu:2.4.0"]
}

target "osecpu-aska" {
  context = "boxes/osecpu-aska"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/osecpu-aska:latest", "esolang/osecpu-aska:2.4.0"]
}

target "piet" {
  context = "boxes/piet"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/piet:latest", "esolang/piet:2.4.0"]
}

target "python1" {
  context = "boxes/python1"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/python1:latest", "esolang/python1:2.4.0"]
}

target "python2" {
  context = "boxes/python2"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/python2:latest", "esolang/python2:2.4.0"]
}

target "aubergine" {
  context = "boxes/aubergine"
  contexts = {
    "esolang/python2" = "target:python2"
  }
  tags = ["esolang/aubergine:latest", "esolang/aubergine:2.4.0"]
}

target "brainfuck-esotope" {
  context = "boxes/brainfuck-esotope"
  contexts = {
    "esolang/python2" = "target:python2"
  }
  tags = ["esolang/brainfuck-esotope:latest", "esolang/brainfuck-esotope:2.4.0"]
}

target "fernando" {
  context = "boxes/fernando"
  contexts = {
    "esolang/python2" = "target:python2"
  }
  tags = ["esolang/fernando:latest", "esolang/fernando:2.4.0"]
}

target "gs2" {
  context = "boxes/gs2"
  contexts = {
    "esolang/python2" = "target:python2"
  }
  tags = ["esolang/gs2:latest", "esolang/gs2:2.4.0"]
}

target "haystack" {
  context = "boxes/haystack"
  contexts = {
    "esolang/python2" = "target:python2"
  }
  tags = ["esolang/haystack:latest", "esolang/haystack:2.4.0"]
}

target "i4004asm" {
  context = "boxes/i4004asm"
  contexts = {
    "esolang/python2" = "target:python2"
  }
  tags = ["esolang/i4004asm:latest", "esolang/i4004asm:2.4.0"]
}

target "logicode" {
  context = "boxes/logicode"
  contexts = {
    "esolang/python2" = "target:python2"
  }
  tags = ["esolang/logicode:latest", "esolang/logicode:2.4.0"]
}

target "minimal2d" {
  context = "boxes/minimal2d"
  contexts = {
    "esolang/python2" = "target:python2"
  }
  tags = ["esolang/minimal2d:latest", "esolang/minimal2d:2.4.0"]
}

target "path" {
  context = "boxes/path"
  contexts = {
    "esolang/python2" = "target:python2"
  }
  tags = ["esolang/path:latest", "esolang/path:2.4.0"]
}

target "recurse" {
  context = "boxes/recurse"
  contexts = {
    "esolang/python2" = "target:python2"
  }
  tags = ["esolang/recurse:latest", "esolang/recurse:2.4.0"]
}

target "snusp" {
  context = "boxes/snusp"
  contexts = {
    "esolang/python2" = "target:python2"
  }
  tags = ["esolang/snusp:latest", "esolang/snusp:2.4.0"]
}

target "stuck" {
  context = "boxes/stuck"
  contexts = {
    "esolang/python2" = "target:python2"
  }
  tags = ["esolang/stuck:latest", "esolang/stuck:2.4.0"]
}

target "suzy" {
  context = "boxes/suzy"
  contexts = {
    "esolang/python2" = "target:python2"
  }
  tags = ["esolang/suzy:latest", "esolang/suzy:2.4.0"]
}

target "unicat" {
  context = "boxes/unicat"
  contexts = {
    "esolang/python2" = "target:python2"
  }
  tags = ["esolang/unicat:latest", "esolang/unicat:2.4.0"]
}

target "unreadable" {
  context = "boxes/unreadable"
  contexts = {
    "esolang/python2" = "target:python2"
  }
  tags = ["esolang/unreadable:latest", "esolang/unreadable:2.4.0"]
}

target "zombie" {
  context = "boxes/zombie"
  contexts = {
    "esolang/python2" = "target:python2"
  }
  tags = ["esolang/zombie:latest", "esolang/zombie:2.4.0"]
}

target "r-language" {
  context = "boxes/r-language"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/r-language:latest", "esolang/r-language:2.4.0"]
}

target "rail" {
  context = "boxes/rail"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/rail:latest", "esolang/rail:2.4.0"]
}

target "rapira" {
  context = "boxes/rapira"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/rapira:latest", "esolang/rapira:2.4.0"]
}

target "rescript" {
  context = "boxes/rescript"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/rescript:latest", "esolang/rescript:2.4.0"]
}

target "ring" {
  context = "boxes/ring"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/ring:latest", "esolang/ring:2.4.0"]
}

target "ruby" {
  context = "boxes/ruby"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/ruby:latest", "esolang/ruby:2.4.0"]
}

target "alice" {
  context = "boxes/alice"
  contexts = {
    "esolang/ruby" = "target:ruby"
  }
  tags = ["esolang/alice:latest", "esolang/alice:2.4.0"]
}

target "arithmetic" {
  context = "boxes/arithmetic"
  contexts = {
    "esolang/ruby" = "target:ruby"
  }
  tags = ["esolang/arithmetic:latest", "esolang/arithmetic:2.4.0"]
}

target "brainfuck-esomer" {
  context = "boxes/brainfuck-esomer"
  contexts = {
    "esolang/ruby" = "target:ruby"
  }
  tags = ["esolang/brainfuck-esomer:latest", "esolang/brainfuck-esomer:2.4.0"]
}

target "copos-rb" {
  context = "boxes/copos-rb"
  contexts = {
    "esolang/ruby" = "target:ruby"
  }
  tags = ["esolang/copos-rb:latest", "esolang/copos-rb:2.4.0"]
}

target "cy" {
  context = "boxes/cy"
  contexts = {
    "esolang/ruby" = "target:ruby"
  }
  tags = ["esolang/cy:latest", "esolang/cy:2.4.0"]
}

target "golfish" {
  context = "boxes/golfish"
  contexts = {
    "esolang/ruby" = "target:ruby"
  }
  tags = ["esolang/golfish:latest", "esolang/golfish:2.4.0"]
}

target "golfscript" {
  context = "boxes/golfscript"
  contexts = {
    "esolang/ruby" = "target:ruby"
  }
  tags = ["esolang/golfscript:latest", "esolang/golfscript:2.4.0"]
}

target "hexagony" {
  context = "boxes/hexagony"
  contexts = {
    "esolang/ruby" = "target:ruby"
  }
  tags = ["esolang/hexagony:latest", "esolang/hexagony:2.4.0"]
}

target "labyrinth" {
  context = "boxes/labyrinth"
  contexts = {
    "esolang/ruby" = "target:ruby"
  }
  tags = ["esolang/labyrinth:latest", "esolang/labyrinth:2.4.0"]
}

target "pxem" {
  context = "boxes/pxem"
  contexts = {
    "esolang/ruby" = "target:ruby"
  }
  tags = ["esolang/pxem:latest", "esolang/pxem:2.4.0"]
}

target "pyramid-scheme" {
  context = "boxes/pyramid-scheme"
  contexts = {
    "esolang/ruby" = "target:ruby"
  }
  tags = ["esolang/pyramid-scheme:latest", "esolang/pyramid-scheme:2.4.0"]
}

target "reversed-c" {
  context = "boxes/reversed-c"
  contexts = {
    "esolang/ruby" = "target:ruby"
  }
  tags = ["esolang/reversed-c:latest", "esolang/reversed-c:2.4.0"]
}

target "ruby-trunk" {
  context = "boxes/ruby-trunk"
  contexts = {
    "esolang/ruby" = "target:ruby"
  }
  tags = ["esolang/ruby-trunk:latest", "esolang/ruby-trunk:2.4.0"]
}

target "stackcats" {
  context = "boxes/stackcats"
  contexts = {
    "esolang/ruby" = "target:ruby"
  }
  tags = ["esolang/stackcats:latest", "esolang/stackcats:2.4.0"]
}

target "standback" {
  context = "boxes/standback"
  contexts = {
    "esolang/ruby" = "target:ruby"
  }
  tags = ["esolang/standback:latest", "esolang/standback:2.4.0"]
}

target "starry" {
  context = "boxes/starry"
  contexts = {
    "esolang/ruby" = "target:ruby"
  }
  tags = ["esolang/starry:latest", "esolang/starry:2.4.0"]
}

target "typhon" {
  context = "boxes/typhon"
  contexts = {
    "esolang/ruby" = "target:ruby"
  }
  tags = ["esolang/typhon:latest", "esolang/typhon:2.4.0"]
}

target "vim" {
  context = "boxes/vim"
  contexts = {
    "esolang/ruby" = "target:ruby"
  }
  tags = ["esolang/vim:latest", "esolang/vim:2.4.0"]
}

target "autovim" {
  context = "boxes/autovim"
  contexts = {
    "esolang/vim" = "target:vim"
  }
  tags = ["esolang/autovim:latest", "esolang/autovim:2.4.0"]
}

target "v-vim" {
  context = "boxes/v-vim"
  contexts = {
    "esolang/vim" = "target:vim"
  }
  tags = ["esolang/v-vim:latest", "esolang/v-vim:2.4.0"]
}

target "wake" {
  context = "boxes/wake"
  contexts = {
    "esolang/ruby" = "target:ruby"
  }
  tags = ["esolang/wake:latest", "esolang/wake:2.4.0"]
}

target "ruby1" {
  context = "boxes/ruby1"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/ruby1:latest", "esolang/ruby1:2.4.0"]
}

target "grass" {
  context = "boxes/grass"
  contexts = {
    "esolang/ruby1" = "target:ruby1"
  }
  tags = ["esolang/grass:latest", "esolang/grass:2.4.0"]
}

target "modanshogi" {
  context = "boxes/modanshogi"
  contexts = {
    "esolang/ruby1" = "target:ruby1"
  }
  tags = ["esolang/modanshogi:latest", "esolang/modanshogi:2.4.0"]
}

target "ppap" {
  context = "boxes/ppap"
  contexts = {
    "esolang/ruby1" = "target:ruby1"
  }
  tags = ["esolang/ppap:latest", "esolang/ppap:2.4.0"]
}

target "rust" {
  context = "boxes/rust"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/rust:latest", "esolang/rust:2.4.0"]
}

target "sceql" {
  context = "boxes/sceql"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/sceql:latest", "esolang/sceql:2.4.0"]
}

target "simula" {
  context = "boxes/simula"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/simula:latest", "esolang/simula:2.4.0"]
}

target "snobol" {
  context = "boxes/snobol"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/snobol:latest", "esolang/snobol:2.4.0"]
}

target "snowman" {
  context = "boxes/snowman"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/snowman:latest", "esolang/snowman:2.4.0"]
}

target "spl" {
  context = "boxes/spl"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/spl:latest", "esolang/spl:2.4.0"]
}

target "streem" {
  context = "boxes/streem"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/streem:latest", "esolang/streem:2.4.0"]
}

target "taxi" {
  context = "boxes/taxi"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/taxi:latest", "esolang/taxi:2.4.0"]
}

target "tcl" {
  context = "boxes/tcl"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/tcl:latest", "esolang/tcl:2.4.0"]
}

target "unlambda" {
  context = "boxes/unlambda"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/unlambda:latest", "esolang/unlambda:2.4.0"]
}

target "verilog" {
  context = "boxes/verilog"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/verilog:latest", "esolang/verilog:2.4.0"]
}

target "vlang" {
  context = "boxes/vlang"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/vlang:latest", "esolang/vlang:2.4.0"]
}

target "wat" {
  context = "boxes/wat"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/wat:latest", "esolang/wat:2.4.0"]
}

target "wierd" {
  context = "boxes/wierd"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/wierd:latest", "esolang/wierd:2.4.0"]
}

target "wordcpu" {
  context = "boxes/wordcpu"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/wordcpu:latest", "esolang/wordcpu:2.4.0"]
}

target "wren" {
  context = "boxes/wren"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/wren:latest", "esolang/wren:2.4.0"]
}

target "zsh-pure" {
  context = "boxes/zsh-pure"
  contexts = {
    "esolang/build-base" = "target:build-base"
  }
  tags = ["esolang/zsh-pure:latest", "esolang/zsh-pure:2.4.0"]
}

target "cmd" {
  context = "boxes/cmd"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/cmd:latest", "esolang/cmd:2.4.0"]
}

target "csharp" {
  context = "boxes/csharp"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/csharp:latest", "esolang/csharp:2.4.0"]
}

target "bubble-sort" {
  context = "boxes/bubble-sort"
  contexts = {
    "esolang/csharp" = "target:csharp"
  }
  tags = ["esolang/bubble-sort:latest", "esolang/bubble-sort:2.4.0"]
}

target "classic-music-theory" {
  context = "boxes/classic-music-theory"
  contexts = {
    "esolang/csharp" = "target:csharp"
  }
  tags = ["esolang/classic-music-theory:latest", "esolang/classic-music-theory:2.4.0"]
}

target "concise-folders" {
  context = "boxes/concise-folders"
  contexts = {
    "esolang/csharp" = "target:csharp"
  }
  tags = ["esolang/concise-folders:latest", "esolang/concise-folders:2.4.0"]
}

target "function2d" {
  context = "boxes/function2d"
  contexts = {
    "esolang/csharp" = "target:csharp"
  }
  tags = ["esolang/function2d:latest", "esolang/function2d:2.4.0"]
}

target "produire" {
  context = "boxes/produire"
  contexts = {
    "esolang/csharp" = "target:csharp"
  }
  tags = ["esolang/produire:latest", "esolang/produire:2.4.0"]
}

target "velato" {
  context = "boxes/velato"
  contexts = {
    "esolang/csharp" = "target:csharp"
  }
  tags = ["esolang/velato:latest", "esolang/velato:2.4.0"]
}

target "z80" {
  context = "boxes/z80"
  contexts = {
    "esolang/csharp" = "target:csharp"
  }
  tags = ["esolang/z80:latest", "esolang/z80:2.4.0"]
}

target "erlang" {
  context = "boxes/erlang"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/erlang:latest", "esolang/erlang:2.4.0"]
}

target "elixir" {
  context = "boxes/elixir"
  contexts = {
    "esolang/erlang" = "target:erlang"
  }
  tags = ["esolang/elixir:latest", "esolang/elixir:2.4.0"]
}

target "05ab1e" {
  context = "boxes/05ab1e"
  contexts = {
    "esolang/elixir" = "target:elixir"
  }
  tags = ["esolang/05ab1e:latest", "esolang/05ab1e:2.4.0"]
}

target "ffmpeg" {
  context = "boxes/ffmpeg"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/ffmpeg:latest", "esolang/ffmpeg:2.4.0"]
}

target "gnuplot" {
  context = "boxes/gnuplot"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/gnuplot:latest", "esolang/gnuplot:2.4.0"]
}

target "golang" {
  context = "boxes/golang"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/golang:latest", "esolang/golang:2.4.0"]
}

target "braintwist" {
  context = "boxes/braintwist"
  contexts = {
    "esolang/golang" = "target:golang"
  }
  tags = ["esolang/braintwist:latest", "esolang/braintwist:2.4.0"]
}

target "oh" {
  context = "boxes/oh"
  contexts = {
    "esolang/golang" = "target:golang"
  }
  tags = ["esolang/oh:latest", "esolang/oh:2.4.0"]
}

target "tsp" {
  context = "boxes/tsp"
  contexts = {
    "esolang/golang" = "target:golang"
  }
  tags = ["esolang/tsp:latest", "esolang/tsp:2.4.0"]
}

target "haskell" {
  context = "boxes/haskell"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/haskell:latest", "esolang/haskell:2.4.0"]
}

target "husk" {
  context = "boxes/husk"
  contexts = {
    "esolang/haskell" = "target:haskell"
  }
  tags = ["esolang/husk:latest", "esolang/husk:2.4.0"]
}

target "squared-cool" {
  context = "boxes/squared-cool"
  contexts = {
    "esolang/haskell" = "target:haskell"
  }
  tags = ["esolang/squared-cool:latest", "esolang/squared-cool:2.4.0"]
}

target "whitespace" {
  context = "boxes/whitespace"
  contexts = {
    "esolang/haskell" = "target:haskell"
  }
  tags = ["esolang/whitespace:latest", "esolang/whitespace:2.4.0"]
}

target "java" {
  context = "boxes/java"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/java:latest", "esolang/java:2.4.0"]
}

target "arnoidc" {
  context = "boxes/arnoidc"
  contexts = {
    "esolang/java" = "target:java"
  }
  tags = ["esolang/arnoidc:latest", "esolang/arnoidc:2.4.0"]
}

target "cjam" {
  context = "boxes/cjam"
  contexts = {
    "esolang/java" = "target:java"
  }
  tags = ["esolang/cjam:latest", "esolang/cjam:2.4.0"]
}

target "convex" {
  context = "boxes/convex"
  contexts = {
    "esolang/java" = "target:java"
  }
  tags = ["esolang/convex:latest", "esolang/convex:2.4.0"]
}

target "evil" {
  context = "boxes/evil"
  contexts = {
    "esolang/java" = "target:java"
  }
  tags = ["esolang/evil:latest", "esolang/evil:2.4.0"]
}

target "floater" {
  context = "boxes/floater"
  contexts = {
    "esolang/java" = "target:java"
  }
  tags = ["esolang/floater:latest", "esolang/floater:2.4.0"]
}

target "js-rhino" {
  context = "boxes/js-rhino"
  contexts = {
    "esolang/java" = "target:java"
  }
  tags = ["esolang/js-rhino:latest", "esolang/js-rhino:2.4.0"]
}

target "kotlin" {
  context = "boxes/kotlin"
  contexts = {
    "esolang/java" = "target:java"
  }
  tags = ["esolang/kotlin:latest", "esolang/kotlin:2.4.0"]
}

target "whenever" {
  context = "boxes/whenever"
  contexts = {
    "esolang/java" = "target:java"
  }
  tags = ["esolang/whenever:latest", "esolang/whenever:2.4.0"]
}

target "xslt" {
  context = "boxes/xslt"
  contexts = {
    "esolang/java" = "target:java"
  }
  tags = ["esolang/xslt:latest", "esolang/xslt:2.4.0"]
}

target "jq" {
  context = "boxes/jq"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/jq:latest", "esolang/jq:2.4.0"]
}

target "lua" {
  context = "boxes/lua"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/lua:latest", "esolang/lua:2.4.0"]
}

target "rprogn" {
  context = "boxes/rprogn"
  contexts = {
    "esolang/lua" = "target:lua"
  }
  tags = ["esolang/rprogn:latest", "esolang/rprogn:2.4.0"]
}

target "m4" {
  context = "boxes/m4"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/m4:latest", "esolang/m4:2.4.0"]
}

target "node" {
  context = "boxes/node"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/node:latest", "esolang/node:2.4.0"]
}

target "beam" {
  context = "boxes/beam"
  contexts = {
    "esolang/node" = "target:node"
  }
  tags = ["esolang/beam:latest", "esolang/beam:2.4.0"]
}

target "calc" {
  context = "boxes/calc"
  contexts = {
    "esolang/node" = "target:node"
  }
  tags = ["esolang/calc:latest", "esolang/calc:2.4.0"]
}

target "canvas" {
  context = "boxes/canvas"
  contexts = {
    "esolang/node" = "target:node"
  }
  tags = ["esolang/canvas:latest", "esolang/canvas:2.4.0"]
}

target "compile-time-typescript" {
  context = "boxes/compile-time-typescript"
  contexts = {
    "esolang/node" = "target:node"
  }
  tags = ["esolang/compile-time-typescript:latest", "esolang/compile-time-typescript:2.4.0"]
}

target "cubix" {
  context = "boxes/cubix"
  contexts = {
    "esolang/node" = "target:node"
  }
  tags = ["esolang/cubix:latest", "esolang/cubix:2.4.0"]
}

target "emojifunge" {
  context = "boxes/emojifunge"
  contexts = {
    "esolang/node" = "target:node"
  }
  tags = ["esolang/emojifunge:latest", "esolang/emojifunge:2.4.0"]
}

target "floating" {
  context = "boxes/floating"
  contexts = {
    "esolang/node" = "target:node"
  }
  tags = ["esolang/floating:latest", "esolang/floating:2.4.0"]
}

target "hakerh-base" {
  context = "boxes/hakerh-base"
  contexts = {
    "esolang/node" = "target:node"
  }
  tags = ["esolang/hakerh-base:latest", "esolang/hakerh-base:2.4.0"]
}

target "encapsulation" {
  context = "boxes/encapsulation"
  contexts = {
    "esolang/hakerh-base" = "target:hakerh-base"
  }
  tags = ["esolang/encapsulation:latest", "esolang/encapsulation:2.4.0"]
}

target "functional" {
  context = "boxes/functional"
  contexts = {
    "esolang/hakerh-base" = "target:hakerh-base"
  }
  tags = ["esolang/functional:latest", "esolang/functional:2.4.0"]
}

target "seclusion" {
  context = "boxes/seclusion"
  contexts = {
    "esolang/hakerh-base" = "target:hakerh-base"
  }
  tags = ["esolang/seclusion:latest", "esolang/seclusion:2.4.0"]
}

target "serenity" {
  context = "boxes/serenity"
  contexts = {
    "esolang/hakerh-base" = "target:hakerh-base"
  }
  tags = ["esolang/serenity:latest", "esolang/serenity:2.4.0"]
}

target "transceternal" {
  context = "boxes/transceternal"
  contexts = {
    "esolang/hakerh-base" = "target:hakerh-base"
  }
  tags = ["esolang/transceternal:latest", "esolang/transceternal:2.4.0"]
}

target "htms" {
  context = "boxes/htms"
  contexts = {
    "esolang/node" = "target:node"
  }
  tags = ["esolang/htms:latest", "esolang/htms:2.4.0"]
}

target "japt" {
  context = "boxes/japt"
  contexts = {
    "esolang/node" = "target:node"
  }
  tags = ["esolang/japt:latest", "esolang/japt:2.4.0"]
}

target "maybelater" {
  context = "boxes/maybelater"
  contexts = {
    "esolang/node" = "target:node"
  }
  tags = ["esolang/maybelater:latest", "esolang/maybelater:2.4.0"]
}

target "nadesiko" {
  context = "boxes/nadesiko"
  contexts = {
    "esolang/node" = "target:node"
  }
  tags = ["esolang/nadesiko:latest", "esolang/nadesiko:2.4.0"]
}

target "nuts" {
  context = "boxes/nuts"
  contexts = {
    "esolang/node" = "target:node"
  }
  tags = ["esolang/nuts:latest", "esolang/nuts:2.4.0"]
}

target "qlb" {
  context = "boxes/qlb"
  contexts = {
    "esolang/node" = "target:node"
  }
  tags = ["esolang/qlb:latest", "esolang/qlb:2.4.0"]
}

target "stop" {
  context = "boxes/stop"
  contexts = {
    "esolang/node" = "target:node"
  }
  tags = ["esolang/stop:latest", "esolang/stop:2.4.0"]
}

target "tetris" {
  context = "boxes/tetris"
  contexts = {
    "esolang/node" = "target:node"
  }
  tags = ["esolang/tetris:latest", "esolang/tetris:2.4.0"]
}

target "unicue" {
  context = "boxes/unicue"
  contexts = {
    "esolang/node" = "target:node"
  }
  tags = ["esolang/unicue:latest", "esolang/unicue:2.4.0"]
}

target "wenyan" {
  context = "boxes/wenyan"
  contexts = {
    "esolang/node" = "target:node"
  }
  tags = ["esolang/wenyan:latest", "esolang/wenyan:2.4.0"]
}

target "wysiscript" {
  context = "boxes/wysiscript"
  contexts = {
    "esolang/node" = "target:node"
  }
  tags = ["esolang/wysiscript:latest", "esolang/wysiscript:2.4.0"]
}

target "ocaml" {
  context = "boxes/ocaml"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/ocaml:latest", "esolang/ocaml:2.4.0"]
}

target "coq" {
  context = "boxes/coq"
  contexts = {
    "esolang/ocaml" = "target:ocaml"
  }
  tags = ["esolang/coq:latest", "esolang/coq:2.4.0"]
}

target "octave" {
  context = "boxes/octave"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/octave:latest", "esolang/octave:2.4.0"]
}

target "matl" {
  context = "boxes/matl"
  contexts = {
    "esolang/octave" = "target:octave"
  }
  tags = ["esolang/matl:latest", "esolang/matl:2.4.0"]
}

target "perl" {
  context = "boxes/perl"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/perl:latest", "esolang/perl:2.4.0"]
}

target "element" {
  context = "boxes/element"
  contexts = {
    "esolang/perl" = "target:perl"
  }
  tags = ["esolang/element:latest", "esolang/element:2.4.0"]
}

target "slashes" {
  context = "boxes/slashes"
  contexts = {
    "esolang/perl" = "target:perl"
  }
  tags = ["esolang/slashes:latest", "esolang/slashes:2.4.0"]
}

target "perl6" {
  context = "boxes/perl6"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/perl6:latest", "esolang/perl6:2.4.0"]
}

target "php" {
  context = "boxes/php"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/php:latest", "esolang/php:2.4.0"]
}

target "irc" {
  context = "boxes/irc"
  contexts = {
    "esolang/php" = "target:php"
  }
  tags = ["esolang/irc:latest", "esolang/irc:2.4.0"]
}

target "python3" {
  context = "boxes/python3"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/python3:latest", "esolang/python3:2.4.0"]
}

target "2sable" {
  context = "boxes/2sable"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/2sable:latest", "esolang/2sable:2.4.0"]
}

target "arcyou" {
  context = "boxes/arcyou"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/arcyou:latest", "esolang/arcyou:2.4.0"]
}

target "asciidots" {
  context = "boxes/asciidots"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/asciidots:latest", "esolang/asciidots:2.4.0"]
}

target "backhand" {
  context = "boxes/backhand"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/backhand:latest", "esolang/backhand:2.4.0"]
}

target "bots" {
  context = "boxes/bots"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/bots:latest", "esolang/bots:2.4.0"]
}

target "cardinal" {
  context = "boxes/cardinal"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/cardinal:latest", "esolang/cardinal:2.4.0"]
}

target "emoji" {
  context = "boxes/emoji"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/emoji:latest", "esolang/emoji:2.4.0"]
}

target "exchangeif" {
  context = "boxes/exchangeif"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/exchangeif:latest", "esolang/exchangeif:2.4.0"]
}

target "ezhil" {
  context = "boxes/ezhil"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/ezhil:latest", "esolang/ezhil:2.4.0"]
}

target "ffb" {
  context = "boxes/ffb"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/ffb:latest", "esolang/ffb:2.4.0"]
}

target "fish" {
  context = "boxes/fish"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/fish:latest", "esolang/fish:2.4.0"]
}

target "gaia" {
  context = "boxes/gaia"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/gaia:latest", "esolang/gaia:2.4.0"]
}

target "hbcht" {
  context = "boxes/hbcht"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/hbcht:latest", "esolang/hbcht:2.4.0"]
}

target "hypertorus" {
  context = "boxes/hypertorus"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/hypertorus:latest", "esolang/hypertorus:2.4.0"]
}

target "iwashi" {
  context = "boxes/iwashi"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/iwashi:latest", "esolang/iwashi:2.4.0"]
}

target "jelly" {
  context = "boxes/jelly"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/jelly:latest", "esolang/jelly:2.4.0"]
}

target "jellyfish" {
  context = "boxes/jellyfish"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/jellyfish:latest", "esolang/jellyfish:2.4.0"]
}

target "mao" {
  context = "boxes/mao"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/mao:latest", "esolang/mao:2.4.0"]
}

target "mines" {
  context = "boxes/mines"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/mines:latest", "esolang/mines:2.4.0"]
}

target "picfunge" {
  context = "boxes/picfunge"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/picfunge:latest", "esolang/picfunge:2.4.0"]
}

target "pure-folders" {
  context = "boxes/pure-folders"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/pure-folders:latest", "esolang/pure-folders:2.4.0"]
}

target "triangularity" {
  context = "boxes/triangularity"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/triangularity:latest", "esolang/triangularity:2.4.0"]
}

target "trumpscript" {
  context = "boxes/trumpscript"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/trumpscript:latest", "esolang/trumpscript:2.4.0"]
}

target "ubergenes" {
  context = "boxes/ubergenes"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/ubergenes:latest", "esolang/ubergenes:2.4.0"]
}

target "width" {
  context = "boxes/width"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/width:latest", "esolang/width:2.4.0"]
}

target "zucchini" {
  context = "boxes/zucchini"
  contexts = {
    "esolang/python3" = "target:python3"
  }
  tags = ["esolang/zucchini:latest", "esolang/zucchini:2.4.0"]
}

target "racket" {
  context = "boxes/racket"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/racket:latest", "esolang/racket:2.4.0"]
}

target "riscv" {
  context = "boxes/riscv"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/riscv:latest", "esolang/riscv:2.4.0"]
}

target "sed" {
  context = "boxes/sed"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/sed:latest", "esolang/sed:2.4.0"]
}

target "zig" {
  context = "boxes/zig"
  contexts = {
    "esolang/base" = "target:base"
  }
  tags = ["esolang/zig:latest", "esolang/zig:2.4.0"]
}

target "brainfuck-bfi" {
  context = "boxes/brainfuck-bfi"
  tags = ["esolang/brainfuck-bfi:latest", "esolang/brainfuck-bfi:2.4.0"]
}

target "ubuntu-base" {
  context = "boxes/ubuntu-base"
  tags = ["esolang/ubuntu-base:latest", "esolang/ubuntu-base:2.4.0"]
}

target "abc" {
  context = "boxes/abc"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/abc:latest", "esolang/abc:2.4.0"]
}

target "ada" {
  context = "boxes/ada"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/ada:latest", "esolang/ada:2.4.0"]
}

target "alif" {
  context = "boxes/alif"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/alif:latest", "esolang/alif:2.4.0"]
}

target "apache2-rewrite" {
  context = "boxes/apache2-rewrite"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/apache2-rewrite:latest", "esolang/apache2-rewrite:2.4.0"]
}

target "cpp-clang" {
  context = "boxes/cpp-clang"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/cpp-clang:latest", "esolang/cpp-clang:2.4.0"]
}

target "cpp-compile-time-clang" {
  context = "boxes/cpp-compile-time-clang"
  contexts = {
    "esolang/cpp-clang" = "target:cpp-clang"
  }
  tags = ["esolang/cpp-compile-time-clang:latest", "esolang/cpp-compile-time-clang:2.4.0"]
}

target "crystal" {
  context = "boxes/crystal"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/crystal:latest", "esolang/crystal:2.4.0"]
}

target "csound" {
  context = "boxes/csound"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/csound:latest", "esolang/csound:2.4.0"]
}

target "d-dmd" {
  context = "boxes/d-dmd"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/d-dmd:latest", "esolang/d-dmd:2.4.0"]
}

target "d-gdc" {
  context = "boxes/d-gdc"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/d-gdc:latest", "esolang/d-gdc:2.4.0"]
}

target "ed" {
  context = "boxes/ed"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/ed:latest", "esolang/ed:2.4.0"]
}

target "egison" {
  context = "boxes/egison"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/egison:latest", "esolang/egison:2.4.0"]
}

target "emacs" {
  context = "boxes/emacs"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/emacs:latest", "esolang/emacs:2.4.0"]
}

target "emojicode" {
  context = "boxes/emojicode"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/emojicode:latest", "esolang/emojicode:2.4.0"]
}

target "fugue" {
  context = "boxes/fugue"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/fugue:latest", "esolang/fugue:2.4.0"]
}

target "hack" {
  context = "boxes/hack"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/hack:latest", "esolang/hack:2.4.0"]
}

target "imagemagick" {
  context = "boxes/imagemagick"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/imagemagick:latest", "esolang/imagemagick:2.4.0"]
}

target "moo" {
  context = "boxes/moo"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/moo:latest", "esolang/moo:2.4.0"]
}

target "nim-lang" {
  context = "boxes/nim-lang"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/nim-lang:latest", "esolang/nim-lang:2.4.0"]
}

target "perl1" {
  context = "boxes/perl1"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/perl1:latest", "esolang/perl1:2.4.0"]
}

target "powershell" {
  context = "boxes/powershell"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/powershell:latest", "esolang/powershell:2.4.0"]
}

target "ruby0_49" {
  context = "boxes/ruby0.49"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/ruby0.49:latest", "esolang/ruby0.49:2.4.0"]
}

target "sqlite3" {
  context = "boxes/sqlite3"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/sqlite3:latest", "esolang/sqlite3:2.4.0"]
}

target "swift" {
  context = "boxes/swift"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/swift:latest", "esolang/swift:2.4.0"]
}

target "tex" {
  context = "boxes/tex"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/tex:latest", "esolang/tex:2.4.0"]
}

target "bibtex" {
  context = "boxes/bibtex"
  contexts = {
    "esolang/tex" = "target:tex"
  }
  tags = ["esolang/bibtex:latest", "esolang/bibtex:2.4.0"]
}

target "x86asm-nasm" {
  context = "boxes/x86asm-nasm"
  contexts = {
    "esolang/ubuntu-base" = "target:ubuntu-base"
  }
  tags = ["esolang/x86asm-nasm:latest", "esolang/x86asm-nasm:2.4.0"]
}
