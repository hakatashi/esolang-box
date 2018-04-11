# esolang-box 2.0.0 [![Build Status][travis-image]][travis-url]

[travis-image]: https://travis-ci.org/hakatashi/esolang-box.svg?branch=master
[travis-url]: https://travis-ci.org/hakatashi/esolang-box

100+ esolangs execution environment in Docker images.

## Usage

Distributed docker images are seperated for each esolangs.
For example, docker image for [Evil](https://esolangs.org/wiki/Evil) language is named as `esolang/evil`, which is hosted on [Dockre Hub](https://hub.docker.com/r/esolang/evil/).

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

## List of boxes

* [`esolang/base`](https://hub.docker.com/r/esolang/base/)
    * [`esolang/build-base`](https://hub.docker.com/r/esolang/build-base/)
        * [3var](https://esolangs.org/wiki/3var): [`esolang/3var`](https://hub.docker.com/r/esolang/3var/)
        * [Axo](https://esolangs.org/wiki/Axo): [`esolang/axo`](https://hub.docker.com/r/esolang/axo/)
        * [Befunge-93](https://esolangs.org/wiki/Befunge): [`esolang/befunge93`](https://hub.docker.com/r/esolang/befunge93/)
        * [Befunge-98](https://esolangs.org/wiki/Befunge): [`esolang/befunge98`](https://hub.docker.com/r/esolang/befunge98/)
            * [Seed](https://esolangs.org/wiki/Seed): [`esolang/seed`](https://hub.docker.com/r/esolang/seed/)
        * [Brainfuck (esotope)](https://github.com/lifthrasiir/esotope-bfc): [`esolang/brainfuck-esotope`](https://hub.docker.com/r/esolang/brainfuck-esotope/)
        * [C (GCC)](https://gcc.gnu.org/): [`esolang/c-gcc`](https://hub.docker.com/r/esolang/c-gcc/)
        * [Dis](https://esolangs.org/wiki/Dis): [`esolang/dis`](https://hub.docker.com/r/esolang/dis/)
        * [Glass](https://esolangs.org/wiki/Glass): [`esolang/glass`](https://hub.docker.com/r/esolang/glass/)
        * [Ruby 2.5.0](https://www.ruby-lang.org/): [`esolang/ruby`](https://hub.docker.com/r/esolang/ruby/)
            * [GolfScript](http://www.golfscript.com/golfscript/tutorial.html): [`esolang/golfscript`](https://hub.docker.com/r/esolang/golfscript/)
            * [Hexagony](https://github.com/m-ender/hexagony): [`esolang/hexagony`](https://hub.docker.com/r/esolang/hexagony/)
            * [Stack Cats](https://github.com/m-ender/stackcats): [`esolang/stackcats`](https://hub.docker.com/r/esolang/stackcats/)
            * [PPAP](https://github.com/yhara/ppap-lang): [`esolang/ppap`](https://hub.docker.com/r/esolang/ppap/)
            * [Starry](https://esolangs.org/wiki/Starry): [`esolang/starry`](https://hub.docker.com/r/esolang/starry/)
            * [Cy](https://github.com/cyoce/Cy): [`esolang/cy`](https://hub.docker.com/r/esolang/cy/)
            * [Labyrinth](https://github.com/m-ender/labyrinth): [`esolang/labyrinth`](https://hub.docker.com/r/esolang/labyrinth/)
        * [goruby](https://github.com/ruby/ruby/blob/trunk/man/goruby.1): [`esolang/goruby`](https://hub.docker.com/r/esolang/goruby/)
        * [Ruby 1.8](https://www.ruby-lang.org/): [`esolang/ruby1`](https://hub.docker.com/r/esolang/ruby1/)
            * [Grass](http://www.blue.sky.or.jp/grass/): [`esolang/grass`](https://hub.docker.com/r/esolang/grass/)
            * [ModanShogi](https://github.com/yhara/ShogiModan): [`esolang/modanshogi`](https://hub.docker.com/r/esolang/modanshogi/)
        * [Make](https://www.gnu.org/software/make/): [`esolang/make`](https://hub.docker.com/r/esolang/make/)
        * [Malbolge](https://esolangs.org/wiki/Malbolge): [`esolang/malbolge`](https://hub.docker.com/r/esolang/malbolge/)
        * [Piet](http://www.dangermouse.net/esoteric/piet.html): [`esolang/piet`](https://hub.docker.com/r/esolang/piet/)
        * [Python 1](https://www.python.org/): [`esolang/python1`](https://hub.docker.com/r/esolang/python1/)
        * [Rail](https://esolangs.org/wiki/Rail): [`esolang/rail`](https://hub.docker.com/r/esolang/rail/)
        * [Simula](https://en.wikipedia.org/wiki/Simula): [`esolang/simula`](https://hub.docker.com/r/esolang/simula/)
        * [Snowman](https://github.com/KeyboardFire/snowman-lang): [`esolang/snowman`](https://hub.docker.com/r/esolang/snowman/)
        * [Streem](https://github.com/matz/streem): [`esolang/streem`](https://hub.docker.com/r/esolang/streem/)
        * [Unlambda](http://www.madore.org/~david/programs/unlambda/): [`esolang/unlambda`](https://hub.docker.com/r/esolang/unlambda/)
        * [Verilog (Icarus Verilog)](http://iverilog.icarus.com/): [`esolang/verilog`](https://hub.docker.com/r/esolang/verilog/)
        * [Wierd](http://catseye.tc/node/Wierd.html): [`esolang/wierd`](https://hub.docker.com/r/esolang/wierd/)
        * [Word!CPU](https://esolangs.org/wiki/Word!CPU): [`esolang/wordcpu`](https://hub.docker.com/r/esolang/wordcpu/)
        * [Aheui](http://aheui.github.io/specification.en): [`esolang/aheui`](https://hub.docker.com/r/esolang/aheui/)
        * [Whitespace](https://esolangs.org/wiki/Whitespace): [`esolang/whitespace`](https://hub.docker.com/r/esolang/whitespace/)
        * [Beatnik](https://esolangs.org/wiki/Beatnik): [`esolang/beatnik`](https://hub.docker.com/r/esolang/beatnik/)
        * [Binary lambda calculus](https://tromp.github.io/cl/cl.html): [`esolang/blc`](https://hub.docker.com/r/esolang/blc/)
        * [Z80](https://sites.google.com/site/codegolfingtips/Home/z80): [`esolang/z80`](https://hub.docker.com/r/esolang/z80/)
        * [Shakespeare](http://shakespearelang.sourceforge.net/): [`esolang/spl`](https://hub.docker.com/r/esolang/spl/)
        * [Emojicode](http://www.emojicode.org/): [`esolang/emojicode`](https://hub.docker.com/r/esolang/emojicode/)
        * [INTERCAL](https://en.wikipedia.org/wiki/INTERCAL): [`esolang/intercal`](https://hub.docker.com/r/esolang/intercal/)
        * [LOLCODE](http://lolcode.org/): [`esolang/lolcode`](https://hub.docker.com/r/esolang/lolcode/)
        * [Minus](http://www.golfscript.com/minus/): [`esolang/minus`](https://hub.docker.com/r/esolang/minus/)
        * [SQLite3](https://sqlite.org/): [`esolang/sqlite3`](https://hub.docker.com/r/esolang/sqlite3/)
        * [Taxi](https://bigzaphod.github.io/Taxi/): [`esolang/taxi`](https://hub.docker.com/r/esolang/taxi/)
        * [ADJUST](https://esolangs.org/wiki/ADJUST): [`esolang/adjust`](https://hub.docker.com/r/esolang/adjust/)
        * [wake](http://shinh.skr.jp/wake/): [`esolang/wake`](https://hub.docker.com/r/esolang/wake/)
        * [Braille](https://esolangs.org/wiki/Braille): [`esolang/braille`](https://hub.docker.com/r/esolang/braille/)
    * [Java](https://java.com/): [`esolang/java`](https://hub.docker.com/r/esolang/java/)
        * [ArnoidC](http://lhartikk.github.io/ArnoldC/): [`esolang/arnoidc`](https://hub.docker.com/r/esolang/arnoidc/)
        * [Evil](https://esolangs.org/wiki/Evil): [`esolang/evil`](https://hub.docker.com/r/esolang/evil/)
        * [JavaScript (Rhino)](https://developer.mozilla.org/en-US/docs/Mozilla/Projects/Rhino): [`esolang/js-rhino`](https://hub.docker.com/r/esolang/js-rhino/)
        * [Floater](https://esolangs.org/wiki/Floater): [`esolang/floater`](https://hub.docker.com/r/esolang/floater/)
        * [CJam](https://sourceforge.net/p/cjam/wiki/Home/): [`esolang/cjam`](https://hub.docker.com/r/esolang/cjam/)
        * [Convex](https://github.com/GamrCorps/Convex): [`esolang/convex`](https://hub.docker.com/r/esolang/convex/)
    * [Python 2](https://www.python.org/): [`esolang/python2`](https://hub.docker.com/r/esolang/python2/)
        * [C# (Mono)](http://www.mono-project.com/): [`esolang/csharp`](https://hub.docker.com/r/esolang/csharp/)
            * [Velato](https://github.com/rottytooth/Velato): [`esolang/velato`](https://hub.docker.com/r/esolang/velato/)
            * [Pure Folders](https://esolangs.org/wiki/Folders#Pure_Folders): [`esolang/pure-folders`](https://hub.docker.com/r/esolang/pure-folders/)
                * [Concise Folders](https://esolangs.org/wiki/Folders#Concise_Folders): [`esolang/concise-folders`](https://hub.docker.com/r/esolang/concise-folders/)
        * [Haystack](https://github.com/kade-robertson/haystack): [`esolang/haystack`](https://hub.docker.com/r/esolang/haystack/)
        * [Stuck](https://esolangs.org/wiki/Stuck): [`esolang/stuck`](https://hub.docker.com/r/esolang/stuck/)
        * [Unicat](https://github.com/gemdude46/unicat): [`esolang/unicat`](https://hub.docker.com/r/esolang/unicat/)
        * [Unreadable](https://esolangs.org/wiki/Unreadable): [`esolang/unreadable`](https://hub.docker.com/r/esolang/unreadable/)
        * [ZOMBIE](http://www.dangermouse.net/esoteric/zombie.html): [`esolang/zombie`](https://hub.docker.com/r/esolang/zombie/)
        * [Foobar and Foobaz and Barbaz, oh my!](https://esolangs.org/wiki/Foobar_and_Foobaz_and_Barbaz,_oh_my!): [`esolang/ffb`](https://hub.docker.com/r/esolang/ffb/)
        * [Aubergine](https://esolangs.org/wiki/Aubergine): [`esolang/aubergine`](https://hub.docker.com/r/esolang/aubergine/)
        * [UberGenes](https://esolangs.org/wiki/UberGenes): [`esolang/ubergenes`](https://hub.docker.com/r/esolang/ubergenes/)
        * [PATH](http://pathlang.sourceforge.net/): [`esolang/path`](https://hub.docker.com/r/esolang/path/)
        * [Recurse](https://esolangs.org/wiki/Recurse): [`esolang/recurse`](https://hub.docker.com/r/esolang/recurse/)
        * [FerNANDo](https://esolangs.org/wiki/FerNANDo): [`esolang/fernando`](https://hub.docker.com/r/esolang/fernando/)
        * [gs2](https://github.com/nooodl/gs2): [`esolang/gs2`](https://hub.docker.com/r/esolang/gs2/)
        * [Logicode](https://github.com/LogicodeLang/Logicode): [`esolang/logicode`](https://hub.docker.com/r/esolang/logicode/)
        * [Minimal-2D](https://esolangs.org/wiki/Minimal-2D): [`esolang/minimal2d`](https://hub.docker.com/r/esolang/minimal2d/)
    * [jq](https://stedolan.github.io/jq/): [`esolang/jq`](https://hub.docker.com/r/esolang/jq/)
    * [Node.js](https://nodejs.org/): [`esolang/node`](https://hub.docker.com/r/esolang/node/)
        * [Beam](http://esolangs.org/wiki/Beam): [`esolang/beam`](https://hub.docker.com/r/esolang/beam/)
        * [Cubix](https://github.com/ETHproductions/cubix): [`esolang/cubix`](https://hub.docker.com/r/esolang/cubix/)
        * [Japt](https://github.com/ETHproductions/japt): [`esolang/japt`](https://hub.docker.com/r/esolang/japt/)
    * [Octave](https://www.gnu.org/software/octave/): [`esolang/octave`](https://hub.docker.com/r/esolang/octave/)
        * [MATL](https://github.com/lmendo/MATL): [`esolang/matl`](https://hub.docker.com/r/esolang/matl/)
    * [Perl](https://www.perl.org/): [`esolang/perl`](https://hub.docker.com/r/esolang/perl/)
        * [///](https://esolangs.org/wiki////): [`esolang/slashes`](https://hub.docker.com/r/esolang/slashes/)
        * [Element](https://esolangs.org/wiki/Element): [`esolang/element`](https://hub.docker.com/r/esolang/element/)
    * [PHP 7.0](https://secure.php.net/): [`esolang/php`](https://hub.docker.com/r/esolang/php/)
        * [IRC](https://esolangs.org/wiki/IRC): [`esolang/irc`](https://hub.docker.com/r/esolang/irc/)
    * [Python 3](https://www.python.org/): [`esolang/python3`](https://hub.docker.com/r/esolang/python3/)
        * [TrumpScript](http://samshadwell.me/TrumpScript/): [`esolang/trumpscript`](https://hub.docker.com/r/esolang/trumpscript/)
        * [05AB1E](https://github.com/Adriandmen/05AB1E): [`esolang/05ab1e`](https://hub.docker.com/r/esolang/05ab1e/)
        * [2sable](https://github.com/Adriandmen/2sable): [`esolang/2sable`](https://hub.docker.com/r/esolang/2sable/)
        * [><>](https://esolangs.org/wiki/Fish): [`esolang/fish`](https://hub.docker.com/r/esolang/fish/)
        * [Arcyóu](https://github.com/Nazek42/arcyou): [`esolang/arcyou`](https://hub.docker.com/r/esolang/arcyou/)
        * [Emoji](https://esolangs.org/wiki/Emoji): [`esolang/emoji`](https://hub.docker.com/r/esolang/emoji/)
        * [Zucchini](https://esolangs.org/wiki/Zucchini): [`esolang/zucchini`](https://hub.docker.com/r/esolang/zucchini/)
        * [Cardinal](https://www.esolangs.org/wiki/Cardinal): [`esolang/cardinal`](https://hub.docker.com/r/esolang/cardinal/)
        * [Half-Broken Car in Heavy Traffic](https://esolangs.org/wiki/Half-Broken_Car_in_Heavy_Traffic): [`esolang/hbcht`](https://hub.docker.com/r/esolang/hbcht/)
        * [Jelly](https://github.com/DennisMitchell/jelly): [`esolang/jelly`](https://hub.docker.com/r/esolang/jelly/)
        * [Jellyfish](https://github.com/iatorm/jellyfish): [`esolang/jellyfish`](https://hub.docker.com/r/esolang/jellyfish/)
    * [Vim](http://www.vim.org/): [`esolang/vim`](https://hub.docker.com/r/esolang/vim/)
* [`esolang/ubuntu-base`](https://hub.docker.com/r/esolang/ubuntu-base/)
    * [Crystal](https://crystal-lang.org/): [`esolang/crystal`](https://hub.docker.com/r/esolang/crystal/)
    * [D (DMD)](https://dlang.org/): [`esolang/d-dmd`](https://hub.docker.com/r/esolang/d-dmd/)
    * [D (GDC)](https://dlang.org/): [`esolang/d-gdc`](https://hub.docker.com/r/esolang/d-gdc/)
    * [PowerShell](https://github.com/PowerShell/PowerShell): [`esolang/powershell`](https://hub.docker.com/r/esolang/powershell/)
    * [Ruby 0.49](https://www.ruby-lang.org/): [`esolang/ruby0.49`](https://hub.docker.com/r/esolang/ruby0.49/)
    * [Fugue](https://esolangs.org/wiki/Fugue): [`esolang/fugue`](https://hub.docker.com/r/esolang/fugue/)
* [Brainfuck (BFI)](http://esoteric.sange.fi/brainfuck/impl/interp/BFI.c): [`esolang/brainfuck-bfi`](https://hub.docker.com/r/esolang/brainfuck-bfi/)
* [Bash (pure)](https://tiswww.case.edu/php/chet/bash/bashtop.html): [`esolang/bash-pure`](https://hub.docker.com/r/esolang/bash-pure/)
* [Bash (busybox)](https://busybox.net/): [`esolang/bash-busybox`](https://hub.docker.com/r/esolang/bash-busybox/)

## Notes about some languages

### wake

May be broken and to be fixed.

### Bash (pure)

Simulates behavior of "Bash (builtins)" of [anagol](http://golf.shinh.org/version.rb).

### Brainfuck (bfi)

Unlike `Brainfuck (esotope)`, this execution simulates the `brainfuck` behavior of [Anarchy Golf](http://golf.shinh.org/l.rb?bf).

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

## Blacklisted languages

Below are the list of the languages that cannot even do the minimal jobs needed for esolang-battle.

* ArnorldC
* Haystack
* INTERCAL
* LOGICODE
* ModanShogi
* ~English
* Python 1
* Seed
* ///
* TrumpScript
* Velato
* ZOMBIE

## Build images

Prerequires [dobi](https://github.com/dnephin/dobi).

	$ cd /path/to/esolang-box
	$ ruby build.rb
	$ dobi

## Run spec

Tested with Ruby 2.5.0

	$ bundle install
	$ bundle exec rspec
