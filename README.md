# esolang-box 2.5.0 [![Test][actions-image]][actions-url]

[actions-image]: https://github.com/hakatashi/esolang-box/actions/workflows/test.yml/badge.svg
[actions-url]: https://github.com/hakatashi/esolang-box/actions/workflows/test.yml

Easy and standardized docker images for 200+ esoteric (and non-esoteric) languages.

## Usage

Distributed docker images are separated for each esolangs.

For example docker image for [Evil](https://esolangs.org/wiki/Evil) language is named as `esolang/evil`, which is hosted on [Docker Hub](https://hub.docker.com/r/esolang/evil/).

### How to run your own esolang program

Suppose you have program in the current directory,

```sh
$ echo aeeeaeeewueuueweeueeuewwaaaweaaewaeaawueweeeaeeewaaawueeueweeaweeeueuw > program.evil
```

then you can run the program like the following.

```sh
$ docker run -v `pwd`:/code:ro esolang/evil evil /code/program.evil
Hello, World!
```

### Observing usage of exec syscalls

esolang-box 2.2.0 supports tracing of `execve` and `execveat` syscalls by strace command.
Setting `STRACE_OUTPUT_PATH` environment variables and enabling ptrace will produce strace log to the specified path.

```sh
$ docker run --cap-add=SYS_PTRACE --rm -v `pwd`:/code --env STRACE_OUTPUT_PATH=/code/strace.txt esolang/evil evil /code/program.evil
Hello, World!
```

Some considerations:

* [**Enabling ptrace breaks seccomp filter before kernel 4.8.**](https://bugs.chromium.org/p/project-zero/issues/detail?id=1718) You should be very careful to use `--cap-add=SYS_PTRACE` (especially you must not use it with Xenial).
* Using strace costs a huge performance overhead and syscalls may be 10x slower.

Simple benchmark:

```
~ # cat benchmark.rb
sum = 0
1000.times do |i|
  seq = `seq #{i}`.split.map(&:to_i)
  sum = seq.sum
end
p sum
~ # echo -n "" | time ruby benchmark.rb
499500
real    0m 3.57s
user    0m 0.78s
sys     0m 0.70s
~ # echo -n "" | time strace -f -q -o strace.txt -e trace=execve,execveat ruby benchmark.rb
499500
real    0m 28.90s
user    0m 1.19s
sys     0m 13.73s
```

## List of boxes

* [`esolang/base`](https://hub.docker.com/r/esolang/base/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fbase.json)](https://hub.docker.com/r/esolang/base/)
    * [`esolang/awk`](https://hub.docker.com/r/esolang/awk/): [awk (GNU awk)](http://www.gnu.org/software/gawk/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fawk.json)](https://hub.docker.com/r/esolang/awk/)
    * [`esolang/ballerina`](https://hub.docker.com/r/esolang/ballerina/): [Ballerina](https://ballerina.io/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fballerina.json)](https://hub.docker.com/r/esolang/ballerina/)
    * [`esolang/build-base`](https://hub.docker.com/r/esolang/build-base/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fbuild-base.json)](https://hub.docker.com/r/esolang/build-base/)
        * [`esolang/3var`](https://hub.docker.com/r/esolang/3var/): [3var](https://esolangs.org/wiki/3var) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2F3var.json)](https://hub.docker.com/r/esolang/3var/)
        * [`esolang/adjust`](https://hub.docker.com/r/esolang/adjust/): [ADJUST](https://esolangs.org/wiki/ADJUST) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fadjust.json)](https://hub.docker.com/r/esolang/adjust/)
        * [`esolang/aheui`](https://hub.docker.com/r/esolang/aheui/): [Aheui](http://aheui.github.io/specification.en) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Faheui.json)](https://hub.docker.com/r/esolang/aheui/)
        * [`esolang/alphabeta`](https://hub.docker.com/r/esolang/alphabeta/): [AlphaBeta](https://esolangs.org/wiki/AlphaBeta) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Falphabeta.json)](https://hub.docker.com/r/esolang/alphabeta/)
        * [`esolang/apl`](https://hub.docker.com/r/esolang/apl/): [APL](https://www.gnu.org/software/apl/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fapl.json)](https://hub.docker.com/r/esolang/apl/)
        * [`esolang/axo`](https://hub.docker.com/r/esolang/axo/): [Axo](https://esolangs.org/wiki/Axo) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Faxo.json)](https://hub.docker.com/r/esolang/axo/)
        * [`esolang/bash-pure`](https://hub.docker.com/r/esolang/bash-pure/): [Bash (pure)](https://tiswww.case.edu/php/chet/bash/bashtop.html) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fbash-pure.json)](https://hub.docker.com/r/esolang/bash-pure/)
            * [`esolang/bash-busybox`](https://hub.docker.com/r/esolang/bash-busybox/): [Bash (busybox)](https://busybox.net/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fbash-busybox.json)](https://hub.docker.com/r/esolang/bash-busybox/)
        * [`esolang/beatnik`](https://hub.docker.com/r/esolang/beatnik/): [Beatnik](https://esolangs.org/wiki/Beatnik) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fbeatnik.json)](https://hub.docker.com/r/esolang/beatnik/)
        * [`esolang/befunge93`](https://hub.docker.com/r/esolang/befunge93/): [Befunge-93](https://esolangs.org/wiki/Befunge) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fbefunge93.json)](https://hub.docker.com/r/esolang/befunge93/)
        * [`esolang/befunge98`](https://hub.docker.com/r/esolang/befunge98/): [Befunge-98](https://esolangs.org/wiki/Befunge) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fbefunge98.json)](https://hub.docker.com/r/esolang/befunge98/)
            * [`esolang/seed`](https://hub.docker.com/r/esolang/seed/): [Seed](https://esolangs.org/wiki/Seed) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fseed.json)](https://hub.docker.com/r/esolang/seed/)
        * [`esolang/blc`](https://hub.docker.com/r/esolang/blc/): [Binary lambda calculus](https://tromp.github.io/cl/cl.html) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fblc.json)](https://hub.docker.com/r/esolang/blc/)
        * [`esolang/braille`](https://hub.docker.com/r/esolang/braille/): [Braille](https://esolangs.org/wiki/Braille) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fbraille.json)](https://hub.docker.com/r/esolang/braille/)
        * [`esolang/c-gcc`](https://hub.docker.com/r/esolang/c-gcc/): [C (GCC)](https://gcc.gnu.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fc-gcc.json)](https://hub.docker.com/r/esolang/c-gcc/)
        * [`esolang/clisp-sbcl`](https://hub.docker.com/r/esolang/clisp-sbcl/): [Common LISP (SBCL)](http://www.sbcl.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fclisp-sbcl.json)](https://hub.docker.com/r/esolang/clisp-sbcl/)
        * [`esolang/cobol`](https://hub.docker.com/r/esolang/cobol/): [COBOL](https://open-cobol.sourceforge.io/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fcobol.json)](https://hub.docker.com/r/esolang/cobol/)
        * [`esolang/codemania`](https://hub.docker.com/r/esolang/codemania/): [CodeMania](https://github.com/Tiramister/codemania) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fcodemania.json)](https://hub.docker.com/r/esolang/codemania/)
        * [`esolang/cubically`](https://hub.docker.com/r/esolang/cubically/): [Cubically](https://github.com/aaronryank/Cubically) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fcubically.json)](https://hub.docker.com/r/esolang/cubically/)
        * [`esolang/cyclicbrainfuck`](https://hub.docker.com/r/esolang/cyclicbrainfuck/): [Cyclic Brainfuck](https://github.com/hiromi-mi/cyclicbrainfuck) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fcyclicbrainfuck.json)](https://hub.docker.com/r/esolang/cyclicbrainfuck/)
        * [`esolang/dis`](https://hub.docker.com/r/esolang/dis/): [Dis](https://esolangs.org/wiki/Dis) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fdis.json)](https://hub.docker.com/r/esolang/dis/)
        * [`esolang/dotnet-base`](https://hub.docker.com/r/esolang/dotnet-base/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fdotnet-base.json)](https://hub.docker.com/r/esolang/dotnet-base/)
            * [`esolang/csharp-dotnet`](https://hub.docker.com/r/esolang/csharp-dotnet/): [C# (.NET Core)](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fcsharp-dotnet.json)](https://hub.docker.com/r/esolang/csharp-dotnet/)
            * [`esolang/fsharp-dotnet`](https://hub.docker.com/r/esolang/fsharp-dotnet/): [F# (.NET Core)](https://fsharp.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Ffsharp-dotnet.json)](https://hub.docker.com/r/esolang/fsharp-dotnet/)
            * [`esolang/function2d`](https://hub.docker.com/r/esolang/function2d/): [Function](https://esolangs.org/wiki/Funciton) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Ffunction2d.json)](https://hub.docker.com/r/esolang/function2d/)
            * [`esolang/visualbasic-dotnet`](https://hub.docker.com/r/esolang/visualbasic-dotnet/): [Visual Basic (.NET Core)](https://docs.microsoft.com/en-us/dotnet/visual-basic/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fvisualbasic-dotnet.json)](https://hub.docker.com/r/esolang/visualbasic-dotnet/)
        * [`esolang/doubleplusungood`](https://hub.docker.com/r/esolang/doubleplusungood/): [Doubleplusungood](http://argxento.hatenadiary.jp/entry/esolang-advcal12-doubleplusungood) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fdoubleplusungood.json)](https://hub.docker.com/r/esolang/doubleplusungood/)
        * [`esolang/fetlang`](https://hub.docker.com/r/esolang/fetlang/): [Fetlang](https://github.com/fetlang/fetlang) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Ffetlang.json)](https://hub.docker.com/r/esolang/fetlang/)
        * [`esolang/fish-shell-pure`](https://hub.docker.com/r/esolang/fish-shell-pure/): [Fish (pure)](https://fishshell.com/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Ffish-shell-pure.json)](https://hub.docker.com/r/esolang/fish-shell-pure/)
        * [`esolang/fortran`](https://hub.docker.com/r/esolang/fortran/): [Fortran 2018](https://gcc.gnu.org/fortran/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Ffortran.json)](https://hub.docker.com/r/esolang/fortran/)
        * [`esolang/glass`](https://hub.docker.com/r/esolang/glass/): [Glass](https://esolangs.org/wiki/Glass) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fglass.json)](https://hub.docker.com/r/esolang/glass/)
        * [`esolang/goruby`](https://hub.docker.com/r/esolang/goruby/): [goruby](https://github.com/ruby/ruby/blob/master/man/goruby.1) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fgoruby.json)](https://hub.docker.com/r/esolang/goruby/)
        * [`esolang/hanoi_stack`](https://hub.docker.com/r/esolang/hanoi_stack/): [Hanoi_Stack](https://github.com/JP3BGY/Hanoi_Stack/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fhanoi_stack.json)](https://hub.docker.com/r/esolang/hanoi_stack/)
        * [`esolang/intercal`](https://hub.docker.com/r/esolang/intercal/): [INTERCAL](https://en.wikipedia.org/wiki/INTERCAL) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fintercal.json)](https://hub.docker.com/r/esolang/intercal/)
        * [`esolang/lazyk`](https://hub.docker.com/r/esolang/lazyk/): [Lazy-K](https://tromp.github.io/cl/lazy-k.html) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Flazyk.json)](https://hub.docker.com/r/esolang/lazyk/)
        * [`esolang/llvm-ir`](https://hub.docker.com/r/esolang/llvm-ir/): [LLVM 10 IR](https://releases.llvm.org/10.0.0/docs/LangRef.html) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fllvm-ir.json)](https://hub.docker.com/r/esolang/llvm-ir/)
        * [`esolang/lolcode`](https://hub.docker.com/r/esolang/lolcode/): [LOLCODE](http://lolcode.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Flolcode.json)](https://hub.docker.com/r/esolang/lolcode/)
        * [`esolang/make`](https://hub.docker.com/r/esolang/make/): [Make](https://www.gnu.org/software/make/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fmake.json)](https://hub.docker.com/r/esolang/make/)
        * [`esolang/malbolge`](https://hub.docker.com/r/esolang/malbolge/): [Malbolge](https://esolangs.org/wiki/Malbolge) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fmalbolge.json)](https://hub.docker.com/r/esolang/malbolge/)
        * [`esolang/minus`](https://hub.docker.com/r/esolang/minus/): [Minus](http://www.golfscript.com/minus/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fminus.json)](https://hub.docker.com/r/esolang/minus/)
        * [`esolang/multi-reader`](https://hub.docker.com/r/esolang/multi-reader/): [multi-reader](https://github.com/kuromunori/kusogengo) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fmulti-reader.json)](https://hub.docker.com/r/esolang/multi-reader/)
        * [`esolang/olang`](https://hub.docker.com/r/esolang/olang/): [O](https://jadon.io/o/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Folang.json)](https://hub.docker.com/r/esolang/olang/)
        * [`esolang/osecpu`](https://hub.docker.com/r/esolang/osecpu/): [osecpu](http://osecpu.osask.jp/wiki/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fosecpu.json)](https://hub.docker.com/r/esolang/osecpu/)
        * [`esolang/osecpu-aska`](https://hub.docker.com/r/esolang/osecpu-aska/): [osecpu-aska](http://osecpu.osask.jp/wiki/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fosecpu-aska.json)](https://hub.docker.com/r/esolang/osecpu-aska/)
        * [`esolang/piet`](https://hub.docker.com/r/esolang/piet/): [Piet](http://www.dangermouse.net/esoteric/piet.html) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fpiet.json)](https://hub.docker.com/r/esolang/piet/)
        * [`esolang/python1`](https://hub.docker.com/r/esolang/python1/): [Python 1](https://www.python.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fpython1.json)](https://hub.docker.com/r/esolang/python1/)
        * [`esolang/python2`](https://hub.docker.com/r/esolang/python2/): [Python 2](https://www.python.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fpython2.json)](https://hub.docker.com/r/esolang/python2/)
            * [`esolang/aubergine`](https://hub.docker.com/r/esolang/aubergine/): [Aubergine](https://esolangs.org/wiki/Aubergine) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Faubergine.json)](https://hub.docker.com/r/esolang/aubergine/)
            * [`esolang/brainfuck-esotope`](https://hub.docker.com/r/esolang/brainfuck-esotope/): [Brainfuck (esotope)](https://github.com/lifthrasiir/esotope-bfc) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fbrainfuck-esotope.json)](https://hub.docker.com/r/esolang/brainfuck-esotope/)
            * [`esolang/fernando`](https://hub.docker.com/r/esolang/fernando/): [FerNANDo](https://esolangs.org/wiki/FerNANDo) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Ffernando.json)](https://hub.docker.com/r/esolang/fernando/)
            * [`esolang/gs2`](https://hub.docker.com/r/esolang/gs2/): [gs2](https://github.com/nooodl/gs2) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fgs2.json)](https://hub.docker.com/r/esolang/gs2/)
            * [`esolang/haystack`](https://hub.docker.com/r/esolang/haystack/): [Haystack](https://github.com/kade-robertson/haystack) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fhaystack.json)](https://hub.docker.com/r/esolang/haystack/)
            * [`esolang/i4004asm`](https://hub.docker.com/r/esolang/i4004asm/): [Intel 4004 Assembly](https://github.com/CodeAbbey/intel4004-emu) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fi4004asm.json)](https://hub.docker.com/r/esolang/i4004asm/)
            * [`esolang/logicode`](https://hub.docker.com/r/esolang/logicode/): [Logicode](https://github.com/LogicodeLang/Logicode) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Flogicode.json)](https://hub.docker.com/r/esolang/logicode/)
            * [`esolang/minimal2d`](https://hub.docker.com/r/esolang/minimal2d/): [Minimal-2D](https://esolangs.org/wiki/Minimal-2D) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fminimal2d.json)](https://hub.docker.com/r/esolang/minimal2d/)
            * [`esolang/path`](https://hub.docker.com/r/esolang/path/): [PATH](http://pathlang.sourceforge.net/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fpath.json)](https://hub.docker.com/r/esolang/path/)
            * [`esolang/recurse`](https://hub.docker.com/r/esolang/recurse/): [Recurse](https://esolangs.org/wiki/Recurse) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Frecurse.json)](https://hub.docker.com/r/esolang/recurse/)
            * [`esolang/snusp`](https://hub.docker.com/r/esolang/snusp/): [SNUSP](https://esolangs.org/wiki/SNUSP) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fsnusp.json)](https://hub.docker.com/r/esolang/snusp/)
            * [`esolang/stuck`](https://hub.docker.com/r/esolang/stuck/): [Stuck](https://esolangs.org/wiki/Stuck) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fstuck.json)](https://hub.docker.com/r/esolang/stuck/)
            * [`esolang/suzy`](https://hub.docker.com/r/esolang/suzy/): [Suzy](http://esolangs.org/wiki/Suzy) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fsuzy.json)](https://hub.docker.com/r/esolang/suzy/)
            * [`esolang/unicat`](https://hub.docker.com/r/esolang/unicat/): [Unicat](https://github.com/gemdude46/unicat) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Funicat.json)](https://hub.docker.com/r/esolang/unicat/)
            * [`esolang/unreadable`](https://hub.docker.com/r/esolang/unreadable/): [Unreadable](https://esolangs.org/wiki/Unreadable) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Funreadable.json)](https://hub.docker.com/r/esolang/unreadable/)
            * [`esolang/zombie`](https://hub.docker.com/r/esolang/zombie/): [ZOMBIE](http://www.dangermouse.net/esoteric/zombie.html) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fzombie.json)](https://hub.docker.com/r/esolang/zombie/)
        * [`esolang/r-language`](https://hub.docker.com/r/esolang/r-language/): [R](https://cran.r-project.org) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fr-language.json)](https://hub.docker.com/r/esolang/r-language/)
        * [`esolang/rail`](https://hub.docker.com/r/esolang/rail/): [Rail](https://esolangs.org/wiki/Rail) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Frail.json)](https://hub.docker.com/r/esolang/rail/)
        * [`esolang/rapira`](https://hub.docker.com/r/esolang/rapira/): [РАПИРА](https://ru.wikipedia.org/wiki/%D0%A0%D0%B0%D0%BF%D0%B8%D1%80%D0%B0_(%D1%8F%D0%B7%D1%8B%D0%BA_%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F)) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Frapira.json)](https://hub.docker.com/r/esolang/rapira/)
        * [`esolang/rescript`](https://hub.docker.com/r/esolang/rescript/): [ReScript](https://rescript-lang.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Frescript.json)](https://hub.docker.com/r/esolang/rescript/)
        * [`esolang/ring`](https://hub.docker.com/r/esolang/ring/): [Ring](http://ring-lang.sourceforge.net/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fring.json)](https://hub.docker.com/r/esolang/ring/)
        * [`esolang/ruby`](https://hub.docker.com/r/esolang/ruby/): [Ruby 4.0.2](https://www.ruby-lang.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fruby.json)](https://hub.docker.com/r/esolang/ruby/)
            * [`esolang/alice`](https://hub.docker.com/r/esolang/alice/): [Alice](https://github.com/m-ender/alice) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Falice.json)](https://hub.docker.com/r/esolang/alice/)
            * [`esolang/arithmetic`](https://hub.docker.com/r/esolang/arithmetic/): [Arithmetic](https://github.com/toyukan6/Arithmetic) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Farithmetic.json)](https://hub.docker.com/r/esolang/arithmetic/)
            * [`esolang/brainfuck-esomer`](https://hub.docker.com/r/esolang/brainfuck-esomer/): [Brainfuck (esomer)](https://github.com/fabon-f/bf-esomer) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fbrainfuck-esomer.json)](https://hub.docker.com/r/esolang/brainfuck-esomer/)
            * [`esolang/copos-rb`](https://hub.docker.com/r/esolang/copos-rb/): [copos (Ruby)](https://github.com/n4o847/tsg-2018-summer) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fcopos-rb.json)](https://hub.docker.com/r/esolang/copos-rb/)
            * [`esolang/cy`](https://hub.docker.com/r/esolang/cy/): [Cy](https://github.com/cyoce/Cy) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fcy.json)](https://hub.docker.com/r/esolang/cy/)
            * [`esolang/golfish`](https://hub.docker.com/r/esolang/golfish/): [golfish](https://github.com/n4o847/tsg-2018-summer) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fgolfish.json)](https://hub.docker.com/r/esolang/golfish/)
            * [`esolang/golfscript`](https://hub.docker.com/r/esolang/golfscript/): [GolfScript](http://www.golfscript.com/golfscript/tutorial.html) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fgolfscript.json)](https://hub.docker.com/r/esolang/golfscript/)
            * [`esolang/hexagony`](https://hub.docker.com/r/esolang/hexagony/): [Hexagony](https://github.com/m-ender/hexagony) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fhexagony.json)](https://hub.docker.com/r/esolang/hexagony/)
            * [`esolang/labyrinth`](https://hub.docker.com/r/esolang/labyrinth/): [Labyrinth](https://github.com/m-ender/labyrinth) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Flabyrinth.json)](https://hub.docker.com/r/esolang/labyrinth/)
            * [`esolang/pxem`](https://hub.docker.com/r/esolang/pxem/): [Pxem](https://esolangs.org/wiki/Pxem) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fpxem.json)](https://hub.docker.com/r/esolang/pxem/)
            * [`esolang/pyramid-scheme`](https://hub.docker.com/r/esolang/pyramid-scheme/): [Pyramid Scheme](https://github.com/ConorOBrien-Foxx/Pyramid-Scheme) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fpyramid-scheme.json)](https://hub.docker.com/r/esolang/pyramid-scheme/)
            * [`esolang/reversed-c`](https://hub.docker.com/r/esolang/reversed-c/): [reversed-c](https://github.com/cookie-s/reversed-c) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Freversed-c.json)](https://hub.docker.com/r/esolang/reversed-c/)
            * [`esolang/ruby-trunk`](https://hub.docker.com/r/esolang/ruby-trunk/): [Ruby trunk](https://www.ruby-lang.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fruby-trunk.json)](https://hub.docker.com/r/esolang/ruby-trunk/)
            * [`esolang/stackcats`](https://hub.docker.com/r/esolang/stackcats/): [Stack Cats](https://github.com/m-ender/stackcats) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fstackcats.json)](https://hub.docker.com/r/esolang/stackcats/)
            * [`esolang/standback`](https://hub.docker.com/r/esolang/standback/): [(?i:standback)](https://github.com/akouryy/standback) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fstandback.json)](https://hub.docker.com/r/esolang/standback/)
            * [`esolang/starry`](https://hub.docker.com/r/esolang/starry/): [Starry](https://esolangs.org/wiki/Starry) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fstarry.json)](https://hub.docker.com/r/esolang/starry/)
            * [`esolang/typhon`](https://hub.docker.com/r/esolang/typhon/): [Typhon](https://github.com/nefo-mi/Typhon) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Ftyphon.json)](https://hub.docker.com/r/esolang/typhon/)
            * [`esolang/vim`](https://hub.docker.com/r/esolang/vim/): [Vim](http://www.vim.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fvim.json)](https://hub.docker.com/r/esolang/vim/)
                * [`esolang/autovim`](https://hub.docker.com/r/esolang/autovim/): [Autovim](https://github.com/christianrondeau/autovim) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fautovim.json)](https://hub.docker.com/r/esolang/autovim/)
                * [`esolang/v-vim`](https://hub.docker.com/r/esolang/v-vim/): [V (Vim)](https://github.com/DJMcMayhem/V) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fv-vim.json)](https://hub.docker.com/r/esolang/v-vim/)
            * [`esolang/wake`](https://hub.docker.com/r/esolang/wake/): [wake](http://shinh.skr.jp/wake/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fwake.json)](https://hub.docker.com/r/esolang/wake/)
        * [`esolang/ruby1`](https://hub.docker.com/r/esolang/ruby1/): [Ruby 1.8](https://www.ruby-lang.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fruby1.json)](https://hub.docker.com/r/esolang/ruby1/)
            * [`esolang/grass`](https://hub.docker.com/r/esolang/grass/): [Grass](http://www.blue.sky.or.jp/grass/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fgrass.json)](https://hub.docker.com/r/esolang/grass/)
            * [`esolang/modanshogi`](https://hub.docker.com/r/esolang/modanshogi/): [ModanShogi](https://github.com/yhara/ShogiModan) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fmodanshogi.json)](https://hub.docker.com/r/esolang/modanshogi/)
            * [`esolang/ppap`](https://hub.docker.com/r/esolang/ppap/): [PPAP](https://github.com/yhara/ppap-lang) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fppap.json)](https://hub.docker.com/r/esolang/ppap/)
        * [`esolang/rust`](https://hub.docker.com/r/esolang/rust/): [Rust](https://www.rust-lang.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Frust.json)](https://hub.docker.com/r/esolang/rust/)
        * [`esolang/sceql`](https://hub.docker.com/r/esolang/sceql/): [Sceql](http://esolangs.org/wiki/Sceql) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fsceql.json)](https://hub.docker.com/r/esolang/sceql/)
        * [`esolang/simula`](https://hub.docker.com/r/esolang/simula/): [Simula](https://en.wikipedia.org/wiki/Simula) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fsimula.json)](https://hub.docker.com/r/esolang/simula/)
        * [`esolang/snobol`](https://hub.docker.com/r/esolang/snobol/): [SNOBOL4](https://www.regressive.org/snobol4/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fsnobol.json)](https://hub.docker.com/r/esolang/snobol/)
        * [`esolang/snowman`](https://hub.docker.com/r/esolang/snowman/): [Snowman](https://github.com/tckmn/snowman-lang) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fsnowman.json)](https://hub.docker.com/r/esolang/snowman/)
        * [`esolang/spl`](https://hub.docker.com/r/esolang/spl/): [Shakespeare](https://github.com/TryItOnline/spl) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fspl.json)](https://hub.docker.com/r/esolang/spl/)
        * [`esolang/streem`](https://hub.docker.com/r/esolang/streem/): [Streem](https://github.com/matz/streem) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fstreem.json)](https://hub.docker.com/r/esolang/streem/)
        * [`esolang/taxi`](https://hub.docker.com/r/esolang/taxi/): [Taxi](https://bigzaphod.github.io/Taxi/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Ftaxi.json)](https://hub.docker.com/r/esolang/taxi/)
        * [`esolang/tcl`](https://hub.docker.com/r/esolang/tcl/): [Tcl](https://www.tcl.tk) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Ftcl.json)](https://hub.docker.com/r/esolang/tcl/)
        * [`esolang/unlambda`](https://hub.docker.com/r/esolang/unlambda/): [Unlambda](http://www.madore.org/~david/programs/unlambda/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Funlambda.json)](https://hub.docker.com/r/esolang/unlambda/)
        * [`esolang/verilog`](https://hub.docker.com/r/esolang/verilog/): [Verilog (Icarus Verilog)](https://steveicarus.github.io/iverilog/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fverilog.json)](https://hub.docker.com/r/esolang/verilog/)
        * [`esolang/vlang`](https://hub.docker.com/r/esolang/vlang/): [V](https://vlang.io/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fvlang.json)](https://hub.docker.com/r/esolang/vlang/)
        * [`esolang/wat`](https://hub.docker.com/r/esolang/wat/): [WebAssembly Text Format](https://webassembly.github.io/spec/core/text/index.html) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fwat.json)](https://hub.docker.com/r/esolang/wat/)
        * [`esolang/wierd`](https://hub.docker.com/r/esolang/wierd/): [Wierd](http://catseye.tc/node/Wierd.html) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fwierd.json)](https://hub.docker.com/r/esolang/wierd/)
        * [`esolang/wordcpu`](https://hub.docker.com/r/esolang/wordcpu/): [Word!CPU](https://esolangs.org/wiki/Word!CPU) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fwordcpu.json)](https://hub.docker.com/r/esolang/wordcpu/)
        * [`esolang/wren`](https://hub.docker.com/r/esolang/wren/): [Wren](http://wren.io/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fwren.json)](https://hub.docker.com/r/esolang/wren/)
        * [`esolang/zsh-pure`](https://hub.docker.com/r/esolang/zsh-pure/): [Zsh (pure)](http://www.zsh.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fzsh-pure.json)](https://hub.docker.com/r/esolang/zsh-pure/)
    * [`esolang/cmd`](https://hub.docker.com/r/esolang/cmd/): [cmd.exe](https://en.wikipedia.org/wiki/Cmd.exe) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fcmd.json)](https://hub.docker.com/r/esolang/cmd/)
    * [`esolang/csharp`](https://hub.docker.com/r/esolang/csharp/): [C# (Mono)](http://www.mono-project.com/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fcsharp.json)](https://hub.docker.com/r/esolang/csharp/)
        * [`esolang/bubble-sort`](https://hub.docker.com/r/esolang/bubble-sort/): [BubbleSortLanguage](https://github.com/lv100tomato/BubbleSortLanguage) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fbubble-sort.json)](https://hub.docker.com/r/esolang/bubble-sort/)
        * [`esolang/classic-music-theory`](https://hub.docker.com/r/esolang/classic-music-theory/): [ClassicMusicTheoryForProgrammer](https://github.com/lv100tomato/ClassicMusicTheoryForProgrammer) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fclassic-music-theory.json)](https://hub.docker.com/r/esolang/classic-music-theory/)
        * [`esolang/produire`](https://hub.docker.com/r/esolang/produire/): [プロデル](https://rdr.utopiat.net/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fproduire.json)](https://hub.docker.com/r/esolang/produire/)
        * [`esolang/z80`](https://hub.docker.com/r/esolang/z80/): [Z80](http://web.archive.org/web/20200808014233/https://sites.google.com/site/codegolfingtips/Home/z80) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fz80.json)](https://hub.docker.com/r/esolang/z80/)
    * [`esolang/erlang`](https://hub.docker.com/r/esolang/erlang/): [Erlang](http://erlang.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Ferlang.json)](https://hub.docker.com/r/esolang/erlang/)
        * [`esolang/elixir`](https://hub.docker.com/r/esolang/elixir/): [Elixir](https://elixir-lang.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Felixir.json)](https://hub.docker.com/r/esolang/elixir/)
            * [`esolang/05ab1e`](https://hub.docker.com/r/esolang/05ab1e/): [05AB1E](https://github.com/Adriandmen/05AB1E) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2F05ab1e.json)](https://hub.docker.com/r/esolang/05ab1e/)
    * [`esolang/ffmpeg`](https://hub.docker.com/r/esolang/ffmpeg/): [FFmpeg](https://ffmpeg.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fffmpeg.json)](https://hub.docker.com/r/esolang/ffmpeg/)
    * [`esolang/gnuplot`](https://hub.docker.com/r/esolang/gnuplot/): [gnuplot](http://www.gnuplot.info/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fgnuplot.json)](https://hub.docker.com/r/esolang/gnuplot/)
    * [`esolang/golang`](https://hub.docker.com/r/esolang/golang/): [Go](https://golang.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fgolang.json)](https://hub.docker.com/r/esolang/golang/)
        * [`esolang/braintwist`](https://hub.docker.com/r/esolang/braintwist/): [braintwist](https://github.com/nakario/braintwist) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fbraintwist.json)](https://hub.docker.com/r/esolang/braintwist/)
        * [`esolang/tsp`](https://hub.docker.com/r/esolang/tsp/): [TSP](https://github.com/nakario/tsp) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Ftsp.json)](https://hub.docker.com/r/esolang/tsp/)
    * [`esolang/haskell`](https://hub.docker.com/r/esolang/haskell/): [Haskell](https://www.haskell.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fhaskell.json)](https://hub.docker.com/r/esolang/haskell/)
        * [`esolang/whitespace`](https://hub.docker.com/r/esolang/whitespace/): [Whitespace](https://esolangs.org/wiki/Whitespace) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fwhitespace.json)](https://hub.docker.com/r/esolang/whitespace/)
    * [`esolang/java`](https://hub.docker.com/r/esolang/java/): [Java](https://java.com/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fjava.json)](https://hub.docker.com/r/esolang/java/)
        * [`esolang/arnoidc`](https://hub.docker.com/r/esolang/arnoidc/): [ArnoidC](http://lhartikk.github.io/ArnoldC/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Farnoidc.json)](https://hub.docker.com/r/esolang/arnoidc/)
        * [`esolang/cjam`](https://hub.docker.com/r/esolang/cjam/): [CJam](https://sourceforge.net/p/cjam/wiki/Home/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fcjam.json)](https://hub.docker.com/r/esolang/cjam/)
        * [`esolang/convex`](https://hub.docker.com/r/esolang/convex/): [Convex](https://github.com/GamrCorps/Convex) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fconvex.json)](https://hub.docker.com/r/esolang/convex/)
        * [`esolang/evil`](https://hub.docker.com/r/esolang/evil/): [Evil](https://esolangs.org/wiki/Evil) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fevil.json)](https://hub.docker.com/r/esolang/evil/)
        * [`esolang/floater`](https://hub.docker.com/r/esolang/floater/): [Floater](https://esolangs.org/wiki/Floater) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Ffloater.json)](https://hub.docker.com/r/esolang/floater/)
        * [`esolang/js-rhino`](https://hub.docker.com/r/esolang/js-rhino/): [JavaScript (Rhino)](https://esolangs.org/wiki/Nuts) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fjs-rhino.json)](https://hub.docker.com/r/esolang/js-rhino/)
        * [`esolang/kotlin`](https://hub.docker.com/r/esolang/kotlin/): [Kotlin](https://kotlinlang.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fkotlin.json)](https://hub.docker.com/r/esolang/kotlin/)
        * [`esolang/vyxal`](https://hub.docker.com/r/esolang/vyxal/): [Vyxal 3](https://github.com/Vyxal/Vyxal) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fvyxal.json)](https://hub.docker.com/r/esolang/vyxal/)
        * [`esolang/whenever`](https://hub.docker.com/r/esolang/whenever/): [Whenever](http://www.dangermouse.net/esoteric/whenever.html) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fwhenever.json)](https://hub.docker.com/r/esolang/whenever/)
        * [`esolang/xslt`](https://hub.docker.com/r/esolang/xslt/): [XSLT](http://saxon.sourceforge.net/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fxslt.json)](https://hub.docker.com/r/esolang/xslt/)
    * [`esolang/jq`](https://hub.docker.com/r/esolang/jq/): [jq](https://stedolan.github.io/jq/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fjq.json)](https://hub.docker.com/r/esolang/jq/)
    * [`esolang/lua`](https://hub.docker.com/r/esolang/lua/): [Lua](https://www.lua.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Flua.json)](https://hub.docker.com/r/esolang/lua/)
        * [`esolang/rprogn`](https://hub.docker.com/r/esolang/rprogn/): [Reverse Programmer Notation](https://github.com/TehFlaminTaco/Reverse-Programmer-Notation) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Frprogn.json)](https://hub.docker.com/r/esolang/rprogn/)
    * [`esolang/m4`](https://hub.docker.com/r/esolang/m4/): [m4](https://www.gnu.org/software/m4/m4.html) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fm4.json)](https://hub.docker.com/r/esolang/m4/)
    * [`esolang/node`](https://hub.docker.com/r/esolang/node/): [Node.js](https://nodejs.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fnode.json)](https://hub.docker.com/r/esolang/node/)
        * [`esolang/beam`](https://hub.docker.com/r/esolang/beam/): [Beam](http://esolangs.org/wiki/Beam) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fbeam.json)](https://hub.docker.com/r/esolang/beam/)
        * [`esolang/calc`](https://hub.docker.com/r/esolang/calc/): [LibreOffice Calc](https://www.libreoffice.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fcalc.json)](https://hub.docker.com/r/esolang/calc/)
        * [`esolang/canvas`](https://hub.docker.com/r/esolang/canvas/): [Canvas](https://github.com/dzaima/Canvas) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fcanvas.json)](https://hub.docker.com/r/esolang/canvas/)
        * [`esolang/compile-time-typescript`](https://hub.docker.com/r/esolang/compile-time-typescript/): [Compile-time TypeScript](https://github.com/n4o847/compile-time-typescript) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fcompile-time-typescript.json)](https://hub.docker.com/r/esolang/compile-time-typescript/)
        * [`esolang/cubix`](https://hub.docker.com/r/esolang/cubix/): [Cubix](https://github.com/ETHproductions/cubix) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fcubix.json)](https://hub.docker.com/r/esolang/cubix/)
        * [`esolang/emojifunge`](https://hub.docker.com/r/esolang/emojifunge/): [emojifunge](https://github.com/ten986/emojifunge-lang) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Femojifunge.json)](https://hub.docker.com/r/esolang/emojifunge/)
        * [`esolang/floating`](https://hub.docker.com/r/esolang/floating/): [Floating](https://github.com/KPCCoiL/floating-lang) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Ffloating.json)](https://hub.docker.com/r/esolang/floating/)
        * [`esolang/hakerh-base`](https://hub.docker.com/r/esolang/hakerh-base/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fhakerh-base.json)](https://hub.docker.com/r/esolang/hakerh-base/)
            * [`esolang/encapsulation`](https://hub.docker.com/r/esolang/encapsulation/): [Encapsulation](https://esolangs.org/wiki/Encapsulation) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fencapsulation.json)](https://hub.docker.com/r/esolang/encapsulation/)
            * [`esolang/functional`](https://hub.docker.com/r/esolang/functional/): [Functional()](https://esolangs.org/wiki/Functional()) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Ffunctional.json)](https://hub.docker.com/r/esolang/functional/)
            * [`esolang/seclusion`](https://hub.docker.com/r/esolang/seclusion/): [Seclusion](https://esolangs.org/wiki/Seclusion) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fseclusion.json)](https://hub.docker.com/r/esolang/seclusion/)
            * [`esolang/serenity`](https://hub.docker.com/r/esolang/serenity/): [Serenity](https://esolangs.org/wiki/Serenity) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fserenity.json)](https://hub.docker.com/r/esolang/serenity/)
            * [`esolang/transceternal`](https://hub.docker.com/r/esolang/transceternal/): [Transceternal](https://esolangs.org/wiki/Transceternal) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Ftransceternal.json)](https://hub.docker.com/r/esolang/transceternal/)
        * [`esolang/htms`](https://hub.docker.com/r/esolang/htms/): [htms](https://github.com/OinkIguana/htms) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fhtms.json)](https://hub.docker.com/r/esolang/htms/)
        * [`esolang/japt`](https://hub.docker.com/r/esolang/japt/): [Japt](https://github.com/ETHproductions/japt) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fjapt.json)](https://hub.docker.com/r/esolang/japt/)
        * [`esolang/maybelater`](https://hub.docker.com/r/esolang/maybelater/): [Maybe Later](http://esolangs.org/wiki/Maybe_Later) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fmaybelater.json)](https://hub.docker.com/r/esolang/maybelater/)
        * [`esolang/nadesiko`](https://hub.docker.com/r/esolang/nadesiko/): [なでしこ3](https://nadesi.com/doc3/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fnadesiko.json)](https://hub.docker.com/r/esolang/nadesiko/)
        * [`esolang/nuts`](https://hub.docker.com/r/esolang/nuts/): [Nuts](https://github.com/hoge-fuga-0000/Nuts) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fnuts.json)](https://hub.docker.com/r/esolang/nuts/)
        * [`esolang/qlb`](https://hub.docker.com/r/esolang/qlb/): [‫قلب‬](https://github.com/nasser/---) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fqlb.json)](https://hub.docker.com/r/esolang/qlb/)
        * [`esolang/stop`](https://hub.docker.com/r/esolang/stop/): [STOP](https://github.com/colinjeanne/stop-lang) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fstop.json)](https://hub.docker.com/r/esolang/stop/)
        * [`esolang/tetris`](https://hub.docker.com/r/esolang/tetris/): [Tetris](https://github.com/Muratam/tetris-esolang) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Ftetris.json)](https://hub.docker.com/r/esolang/tetris/)
        * [`esolang/unicue`](https://hub.docker.com/r/esolang/unicue/): [Unicue](https://github.com/hakatashi/unicue-lang) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Funicue.json)](https://hub.docker.com/r/esolang/unicue/)
        * [`esolang/wenyan`](https://hub.docker.com/r/esolang/wenyan/): [文言](https://wy-lang.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fwenyan.json)](https://hub.docker.com/r/esolang/wenyan/)
        * [`esolang/wysiscript`](https://hub.docker.com/r/esolang/wysiscript/): [WysiScript](http://www.zifyoip.com/wysiscript/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fwysiscript.json)](https://hub.docker.com/r/esolang/wysiscript/)
    * [`esolang/ocaml`](https://hub.docker.com/r/esolang/ocaml/): [OCaml](http://ocaml.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Focaml.json)](https://hub.docker.com/r/esolang/ocaml/)
        * [`esolang/coq`](https://hub.docker.com/r/esolang/coq/): [Coq](https://coq.inria.fr/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fcoq.json)](https://hub.docker.com/r/esolang/coq/)
    * [`esolang/octave`](https://hub.docker.com/r/esolang/octave/): [Octave](https://www.gnu.org/software/octave/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Foctave.json)](https://hub.docker.com/r/esolang/octave/)
        * [`esolang/matl`](https://hub.docker.com/r/esolang/matl/): [MATL](https://github.com/lmendo/MATL) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fmatl.json)](https://hub.docker.com/r/esolang/matl/)
    * [`esolang/perl`](https://hub.docker.com/r/esolang/perl/): [Perl](https://www.perl.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fperl.json)](https://hub.docker.com/r/esolang/perl/)
        * [`esolang/element`](https://hub.docker.com/r/esolang/element/): [Element](https://esolangs.org/wiki/Element) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Felement.json)](https://hub.docker.com/r/esolang/element/)
        * [`esolang/slashes`](https://hub.docker.com/r/esolang/slashes/): [///](https://esolangs.org/wiki////) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fslashes.json)](https://hub.docker.com/r/esolang/slashes/)
    * [`esolang/perl6`](https://hub.docker.com/r/esolang/perl6/): [Perl 6](http://perl6.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fperl6.json)](https://hub.docker.com/r/esolang/perl6/)
    * [`esolang/php`](https://hub.docker.com/r/esolang/php/): [PHP 7.0](https://secure.php.net/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fphp.json)](https://hub.docker.com/r/esolang/php/)
        * [`esolang/irc`](https://hub.docker.com/r/esolang/irc/): [IRC](https://esolangs.org/wiki/IRC) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Firc.json)](https://hub.docker.com/r/esolang/irc/)
    * [`esolang/python3`](https://hub.docker.com/r/esolang/python3/): [Python 3](https://www.python.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fpython3.json)](https://hub.docker.com/r/esolang/python3/)
        * [`esolang/2sable`](https://hub.docker.com/r/esolang/2sable/): [2sable](https://github.com/Adriandmen/2sable) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2F2sable.json)](https://hub.docker.com/r/esolang/2sable/)
        * [`esolang/arcyou`](https://hub.docker.com/r/esolang/arcyou/): [Arcyóu](https://github.com/Nazek42/arcyou) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Farcyou.json)](https://hub.docker.com/r/esolang/arcyou/)
        * [`esolang/asciidots`](https://hub.docker.com/r/esolang/asciidots/): [AsciiDots](http://ajanse.me/asciidots/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fasciidots.json)](https://hub.docker.com/r/esolang/asciidots/)
        * [`esolang/backhand`](https://hub.docker.com/r/esolang/backhand/): [Backhand](https://github.com/GuyJoKing/Backhand) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fbackhand.json)](https://hub.docker.com/r/esolang/backhand/)
        * [`esolang/bots`](https://hub.docker.com/r/esolang/bots/): [Bots](https://github.com/satos---jp/bots) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fbots.json)](https://hub.docker.com/r/esolang/bots/)
        * [`esolang/cardinal`](https://hub.docker.com/r/esolang/cardinal/): [Cardinal](https://www.esolangs.org/wiki/Cardinal) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fcardinal.json)](https://hub.docker.com/r/esolang/cardinal/)
        * [`esolang/emoji`](https://hub.docker.com/r/esolang/emoji/): [Emoji](https://esolangs.org/wiki/Emoji) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Femoji.json)](https://hub.docker.com/r/esolang/emoji/)
        * [`esolang/exchangeif`](https://hub.docker.com/r/esolang/exchangeif/): [ExchangeIF](https://github.com/HyogaGlacier/ExchangeIF) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fexchangeif.json)](https://hub.docker.com/r/esolang/exchangeif/)
        * [`esolang/ezhil`](https://hub.docker.com/r/esolang/ezhil/): [எழில்](http://ezhillang.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fezhil.json)](https://hub.docker.com/r/esolang/ezhil/)
        * [`esolang/ffb`](https://hub.docker.com/r/esolang/ffb/): [Foobar and Foobaz and Barbaz, oh my!](https://esolangs.org/wiki/Foobar_and_Foobaz_and_Barbaz,_oh_my!) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fffb.json)](https://hub.docker.com/r/esolang/ffb/)
        * [`esolang/fish`](https://hub.docker.com/r/esolang/fish/): [><>](https://esolangs.org/wiki/Fish) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Ffish.json)](https://hub.docker.com/r/esolang/fish/)
        * [`esolang/gaia`](https://hub.docker.com/r/esolang/gaia/): [Gaia](https://github.com/splcurran/Gaia) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fgaia.json)](https://hub.docker.com/r/esolang/gaia/)
        * [`esolang/hbcht`](https://hub.docker.com/r/esolang/hbcht/): [Half-Broken Car in Heavy Traffic](https://esolangs.org/wiki/Half-Broken_Car_in_Heavy_Traffic) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fhbcht.json)](https://hub.docker.com/r/esolang/hbcht/)
        * [`esolang/hypertorus`](https://hub.docker.com/r/esolang/hypertorus/): [HyperTorus](https://github.com/satos---jp/HyperTorus) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fhypertorus.json)](https://hub.docker.com/r/esolang/hypertorus/)
        * [`esolang/iwashi`](https://hub.docker.com/r/esolang/iwashi/): [Iwashi](https://github.com/Yosshi999/iwashi-lang) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fiwashi.json)](https://hub.docker.com/r/esolang/iwashi/)
        * [`esolang/jelly`](https://hub.docker.com/r/esolang/jelly/): [Jelly](https://github.com/DennisMitchell/jelly) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fjelly.json)](https://hub.docker.com/r/esolang/jelly/)
        * [`esolang/jellyfish`](https://hub.docker.com/r/esolang/jellyfish/): [Jellyfish](https://github.com/iatorm/jellyfish) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fjellyfish.json)](https://hub.docker.com/r/esolang/jellyfish/)
        * [`esolang/mao`](https://hub.docker.com/r/esolang/mao/): [MAO](https://github.com/Muratam/markov-algorithm-offline) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fmao.json)](https://hub.docker.com/r/esolang/mao/)
        * [`esolang/mines`](https://hub.docker.com/r/esolang/mines/): [Mines](https://github.com/dnek/mines-esolang) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fmines.json)](https://hub.docker.com/r/esolang/mines/)
        * [`esolang/picfunge`](https://hub.docker.com/r/esolang/picfunge/): [PicFunge](https://github.com/Liesegang/picfunge) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fpicfunge.json)](https://hub.docker.com/r/esolang/picfunge/)
        * [`esolang/pure-folders`](https://hub.docker.com/r/esolang/pure-folders/): [Pure Folders](https://esolangs.org/wiki/Folders#Pure_Folders) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fpure-folders.json)](https://hub.docker.com/r/esolang/pure-folders/)
        * [`esolang/triangularity`](https://hub.docker.com/r/esolang/triangularity/): [Triangularity](https://esolangs.org/wiki/Triangularity) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Ftriangularity.json)](https://hub.docker.com/r/esolang/triangularity/)
        * [`esolang/ubergenes`](https://hub.docker.com/r/esolang/ubergenes/): [UberGenes](https://esolangs.org/wiki/UberGenes) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fubergenes.json)](https://hub.docker.com/r/esolang/ubergenes/)
        * [`esolang/width`](https://hub.docker.com/r/esolang/width/): [Width](https://github.com/stestoltz/Width) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fwidth.json)](https://hub.docker.com/r/esolang/width/)
        * [`esolang/zucchini`](https://hub.docker.com/r/esolang/zucchini/): [Zucchini](https://esolangs.org/wiki/Zucchini) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fzucchini.json)](https://hub.docker.com/r/esolang/zucchini/)
    * [`esolang/racket`](https://hub.docker.com/r/esolang/racket/): [Racket](https://racket-lang.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fracket.json)](https://hub.docker.com/r/esolang/racket/)
    * [`esolang/sed`](https://hub.docker.com/r/esolang/sed/): [sed](https://www.gnu.org/software/sed/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fsed.json)](https://hub.docker.com/r/esolang/sed/)
    * [`esolang/zig`](https://hub.docker.com/r/esolang/zig/): [Zig](https://ziglang.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fzig.json)](https://hub.docker.com/r/esolang/zig/)
* [`esolang/brainfuck-bfi`](https://hub.docker.com/r/esolang/brainfuck-bfi/): [Brainfuck (BFI)](http://esoteric.sange.fi/brainfuck/impl/interp/BFI.c) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fbrainfuck-bfi.json)](https://hub.docker.com/r/esolang/brainfuck-bfi/)
* [`esolang/ubuntu-base`](https://hub.docker.com/r/esolang/ubuntu-base/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fubuntu-base.json)](https://hub.docker.com/r/esolang/ubuntu-base/)
    * [`esolang/abc`](https://hub.docker.com/r/esolang/abc/): [ABC](https://en.wikipedia.org/wiki/ABC_(programming_language)) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fabc.json)](https://hub.docker.com/r/esolang/abc/)
    * [`esolang/ada`](https://hub.docker.com/r/esolang/ada/): [Ada (GNU GNAT)](https://learn.adacore.com/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fada.json)](https://hub.docker.com/r/esolang/ada/)
    * [`esolang/apache2-rewrite`](https://hub.docker.com/r/esolang/apache2-rewrite/): [Apache mod_rewrite](https://httpd.apache.org/docs/2.4/rewrite/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fapache2-rewrite.json)](https://hub.docker.com/r/esolang/apache2-rewrite/)
    * [`esolang/cpp-clang`](https://hub.docker.com/r/esolang/cpp-clang/): [C++ (Clang)](https://clang.llvm.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fcpp-clang.json)](https://hub.docker.com/r/esolang/cpp-clang/)
        * [`esolang/cpp-compile-time-clang`](https://hub.docker.com/r/esolang/cpp-compile-time-clang/): [Compile-time C++ (Clang, C++11)](https://clang.llvm.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fcpp-compile-time-clang.json)](https://hub.docker.com/r/esolang/cpp-compile-time-clang/)
    * [`esolang/crystal`](https://hub.docker.com/r/esolang/crystal/): [Crystal](https://crystal-lang.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fcrystal.json)](https://hub.docker.com/r/esolang/crystal/)
    * [`esolang/csound`](https://hub.docker.com/r/esolang/csound/): [Csound](https://csound.com/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fcsound.json)](https://hub.docker.com/r/esolang/csound/)
    * [`esolang/d-dmd`](https://hub.docker.com/r/esolang/d-dmd/): [D (DMD)](https://dlang.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fd-dmd.json)](https://hub.docker.com/r/esolang/d-dmd/)
    * [`esolang/d-gdc`](https://hub.docker.com/r/esolang/d-gdc/): [D (GDC)](https://dlang.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fd-gdc.json)](https://hub.docker.com/r/esolang/d-gdc/)
    * [`esolang/ed`](https://hub.docker.com/r/esolang/ed/): [GNU ed](http://www.gnu.org/software/ed/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fed.json)](https://hub.docker.com/r/esolang/ed/)
    * [`esolang/egison`](https://hub.docker.com/r/esolang/egison/): [Egison](https://www.egison.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fegison.json)](https://hub.docker.com/r/esolang/egison/)
    * [`esolang/emojicode`](https://hub.docker.com/r/esolang/emojicode/): [Emojicode](http://www.emojicode.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Femojicode.json)](https://hub.docker.com/r/esolang/emojicode/)
    * [`esolang/fugue`](https://hub.docker.com/r/esolang/fugue/): [Fugue](https://esolangs.org/wiki/Fugue) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Ffugue.json)](https://hub.docker.com/r/esolang/fugue/)
    * [`esolang/imagemagick`](https://hub.docker.com/r/esolang/imagemagick/): [ImageMagick](https://imagemagick.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fimagemagick.json)](https://hub.docker.com/r/esolang/imagemagick/)
    * [`esolang/moo`](https://hub.docker.com/r/esolang/moo/): [moo](https://github.com/moratorium08/moo) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fmoo.json)](https://hub.docker.com/r/esolang/moo/)
    * [`esolang/nim-lang`](https://hub.docker.com/r/esolang/nim-lang/): [Nim](https://nim-lang.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fnim-lang.json)](https://hub.docker.com/r/esolang/nim-lang/)
    * [`esolang/perl1`](https://hub.docker.com/r/esolang/perl1/): [Perl 1.0](https://www.perl.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fperl1.json)](https://hub.docker.com/r/esolang/perl1/)
    * [`esolang/powershell`](https://hub.docker.com/r/esolang/powershell/): [PowerShell](https://github.com/PowerShell/PowerShell) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fpowershell.json)](https://hub.docker.com/r/esolang/powershell/)
    * [`esolang/sqlite3`](https://hub.docker.com/r/esolang/sqlite3/): [SQLite3](https://sqlite.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fsqlite3.json)](https://hub.docker.com/r/esolang/sqlite3/)
    * [`esolang/swift`](https://hub.docker.com/r/esolang/swift/): [Swift](https://swift.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fswift.json)](https://hub.docker.com/r/esolang/swift/)
    * [`esolang/tex`](https://hub.docker.com/r/esolang/tex/): [TeX (plain)](http://texdoc.net/texmf-dist/doc/plain/texbytopic/TeXbyTopic.pdf) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Ftex.json)](https://hub.docker.com/r/esolang/tex/)
        * [`esolang/bibtex`](https://hub.docker.com/r/esolang/bibtex/): [BiBTeX](https://ctan.tikz.jp/info/bibtex/tamethebeast/ttb_en.pdf) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fbibtex.json)](https://hub.docker.com/r/esolang/bibtex/)
    * [`esolang/x86asm-nasm`](https://hub.docker.com/r/esolang/x86asm-nasm/): [x86 Assembly (nasm)](https://www.nasm.us/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fx86asm-nasm.json)](https://hub.docker.com/r/esolang/x86asm-nasm/)

## Obsolete languages

These languages are no longer maintained, and their images may be outdated since their last update.

### esolang-box 2.2.0

* [`esolang/squared-cool`](https://hub.docker.com/r/esolang/squared-cool/): [🆒](https://esolangs.org/wiki/%F0%9F%86%92) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fsquared-cool.json)](https://hub.docker.com/r/esolang/squared-cool/)

### esolang-box 2.3.0

* [`esolang/brainfuck-moratorium`](https://hub.docker.com/r/esolang/brainfuck-moratorium/): [Brainfuck (moratorium)](https://gist.github.com/moratorium08/2fa8dbd4150c8db547a1f3a31d5499ac) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fbrainfuck-moratorium.json)](https://hub.docker.com/r/esolang/brainfuck-moratorium/)
* [`esolang/concise-folders`](https://hub.docker.com/r/esolang/concise-folders/): [Concise Folders](https://esolangs.org/wiki/Folders#Concise_Folders) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fconcise-folders.json)](https://hub.docker.com/r/esolang/concise-folders/)
* [`esolang/velato`](https://hub.docker.com/r/esolang/velato/): [Velato](https://github.com/rottytooth/Velato) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fvelato.json)](https://hub.docker.com/r/esolang/velato/)
* [`esolang/husk`](https://hub.docker.com/r/esolang/husk/): [Husk](https://github.com/barbuz/Husk) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fhusk.json)](https://hub.docker.com/r/esolang/husk/)
* [`esolang/trumpscript`](https://hub.docker.com/r/esolang/trumpscript/): [TrumpScript](https://github.com/samshadwell/trumpscript) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Ftrumpscript.json)](https://hub.docker.com/r/esolang/trumpscript/)
* [`esolang/riscv`](https://hub.docker.com/r/esolang/riscv/): [RISC-V (32bit, ELF)](https://riscv.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Friscv.json)](https://hub.docker.com/r/esolang/riscv/)
* [`esolang/ruby0.49`](https://hub.docker.com/r/esolang/ruby0.49/): [Ruby 0.49](https://www.ruby-lang.org/) [![test](https://img.shields.io/endpoint?url=https%3A%2F%2Fhakatashi.github.io%2Fesolang-box%2Fbadges%2Fruby0.49.json)](https://hub.docker.com/r/esolang/ruby0.49/)

## Notes about some languages

### Bash (pure)

Simulates behavior of "Bash (builtins)" in [Anarchy Golf](http://golf.shinh.org/version.rb).

### BibTeX

* `\n` in input is replaced as single space.
* multiple spaces and `\n' in input are replaced as single space.
* The script should call `newline$` at tail of output.
* input will be passed as `input` entry.
* the style type is `source`.

### Brainfuck (bfi)

Unlike `Brainfuck (esotope)`, this execution simulates behavior of "brainfuck" in [Anarchy Golf](http://golf.shinh.org/l.rb?bf).

To achieve this, I have patched a tricky line to the original code.

```patch
--- BFI.c
+++ BFI.c
@@ -46,6 +46,7 @@
   int pc, args, xc, prog_len, l = 0;
   int x[32768];
   int p[32768];
+  int xxx[1] = {'['};

   FILE *stream, *fopen();
```

### Compile-time C++ (Clang, C++11)

Write the constexpr function `f` that receives the `const char*` input as an argument and returns `const char*` output.

### Coq

You can use [coq.io](http://coq.io/).

### Csound
Input file is given as `input.in`. You should write out to `output.out`.

*Note: DO NOT LISTEN TO GENERATED PROGRAM, IT MAY CONTAIN UNEXPECTEDLY LOUD SOUNDS, AND MAY CAUSE EAR DAMAGE.*

### FFmpeg

Input file is given as `in.txt`. You should write out to `out.txt`.
You can use both video and audio.

*Note: DO NOT LISTEN TO out.pcm, IT MAY CONTAIN UNEXPECTEDLY LOUD SOUNDS, AND MAY CAUSE EAR DAMAGE.*

### Make

Input is given as `STDIN` environment variable. This spec is equivalent to [Anarchy Golf](http://golf.shinh.org/l.rb?mk).

### OpenOffice Calc

You can write CSV with the content below the B line.

The input is given in A1 cell.

Output the final result into B1 cell.

### OSECPU and OSECPU-ASKA

Your program must follow these restrictions:
* Graphical user interface is not available
* debugging feature is not available
* On OSECPU: accept OSECPU binary
* On OSECPU-ASKA: accept OSECPU-ASKA source code
* On OSECPU-ASKA: `osecpu_ask.h` and `app.ask` are available at the same directory

The input is given in an file at first argument. You can get the input as follows (see app0129):
```
Int32s fsize:R01;
VPtr p:P01;

junkApi_fileRead(fsize, p, 1);
```

The official archive is built on Windows. To develop on GNU/Linux, follow this article: [takeutch-kemeco's note](https://gist.github.com/takeutch-kemeco/edbe1b1224242514a3bd)

### Pxem

The first line is the file name of the pxem code.

The rest is the content of the pxem code.

### XSLT

The input is given as the content of tag `<input/>`.

Transform that into the desired value.

## Blacklisted languages

Below are the list of the languages that cannot even do the minimal jobs needed for esolang-battle.

*   ArnorldC
*   CodeMania (whitespace is automatically trimmed from input)
*   Doubleplusungood (whitespace is automatically trimmed from input)
*   Gaia (whitespace is automatically trimmed from input)
*   Haystack
*   LOGICODE (Can only take 0 or 1 from input)
*   ModanShogi
*   ~English
*   Python 1
*   РАПИРА (Input number/bool only)
*   Seed
*   STOP (Cannot input or output newlines)
*   ///
*   🆒
*   TrumpScript
*   Velato
*   ZOMBIE

## Build images

The build system of esolang-box is built upon [Docker Build Bake](https://docs.docker.com/build/bake/).

```sh
cd /path/to/esolang-box

# Generates docker-bake.hcl from boxes/*/box.yaml
ruby scripts/build.rb

# Build all images
docker buildx bake

# Build single image
docker buildx bake [box_id]
```

## Run spec

Tested with Ruby 4.0.2

```sh
bundle install

# Run all test cases
bundle exec rspec

# Run all test cases from box
bundle exec rspec -t box_id:c-gcc

# Run single test case
bundle exec rspec -t case_id:python3-hello
```
