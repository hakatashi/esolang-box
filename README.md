# esolang-box 1.1.3 [![Build Status][travis-image]][travis-url]

[travis-image]: https://travis-ci.org/hakatashi/esolang-box.svg?branch=master
[travis-url]: https://travis-ci.org/hakatashi/esolang-box

Esolang value pack in a Docker image.

## Run built-in esolang program

	$ docker run hakatashi/esolang-box hexagony assets/hello.hxg
	Hello, World!

## Run your own esolang program

	$ docker run -v `pwd`:/code:ro hakatashi/esolang-box hexagony /code/program.hxg

## Languages

### Practical Languages

* [Bash (pure)](https://tiswww.case.edu/php/chet/bash/bashtop.html): `bash-pure` (Equivalent to the "Bash (builtins)" of [anagol](http://golf.shinh.org/version.rb))
* [C (GCC)](https://gcc.gnu.org/): `c-gcc`
* [C# (Mono)](http://www.mono-project.com/): `csharp`
* [D (GDC)](https://dlang.org/): `d-gdc`
* [Node.js](https://nodejs.org/): `node`
* [Perl](https://www.perl.org/): `perl`
* [PHP 7.0](https://secure.php.net/): `php`, `php7.0`
* [Python 1](https://www.python.org/): `python1`
* [Python 2](https://www.python.org/): `python`, `python2`, `python2.7`
* [Python 3](https://www.python.org/): `python3`, `python3.5`
* [Ruby 1.8](https://www.ruby-lang.org/): `ruby`, `ruby1.8`
* [Ruby 2.4](https://www.ruby-lang.org/): `ruby2.4`
* [Streem](https://github.com/matz/streem): `streem`
* [Octave](https://www.gnu.org/software/octave/): `octave`

### Esoteric Languages

* [05AB1E](https://github.com/Adriandmen/05AB1E): `05ab1e`
* [2sable](https://github.com/Adriandmen/2sable): `2sable`
* [3var](https://esolangs.org/wiki/3var): `3var`
* [Aheui](http://aheui.github.io/specification.en): `aheui`
* [Arcyóu](https://github.com/Nazek42/arcyou): `arcyou`
* [ArnoidC](http://lhartikk.github.io/ArnoldC/): `arnoidc`
* [Aubergine](https://esolangs.org/wiki/Aubergine): `aubergine`
* [Axo](https://esolangs.org/wiki/Axo): `axo`
* [Beam](http://esolangs.org/wiki/Beam): `beam`
* [Beatnik](https://esolangs.org/wiki/Beatnik): `beatnik`
* [Befunge-93](https://esolangs.org/wiki/Befunge): `befunge93`
* [Befunge-98](https://esolangs.org/wiki/Befunge): `befunge98`
* [Binary lambda calculus](https://tromp.github.io/cl/cl.html): `blc`
* [Brainfuck](https://esolangs.org/wiki/Brainfuck): `brainfuck`
* [Cardinal](https://www.esolangs.org/wiki/Cardinal): `cardinal`
* [CJam](https://sourceforge.net/p/cjam/wiki/Home/): `cjam`
* [Concise Folders](https://esolangs.org/wiki/Folders#Concise_Folders): `concise-folders`
* [Convex](https://github.com/GamrCorps/Convex): `convex`
* [Cubix](https://github.com/ETHproductions/cubix): `cubix`
* [Cy](https://github.com/cyoce/Cy): `cy`
* [Dis](https://esolangs.org/wiki/Dis): `dis`
* [Element](https://esolangs.org/wiki/Element): `element`
* [Emmental](http://catseye.tc/node/Emmental.html): `emmental`
* [Emoji](https://esolangs.org/wiki/Emoji): `emoji`
* [Emojicode](http://www.emojicode.org/): `emojicode`
* [Evil](https://esolangs.org/wiki/Evil): `evil`
* [FerNANDo](https://esolangs.org/wiki/FerNANDo): `fernando`
* [><>](https://esolangs.org/wiki/Fish): `fish`
* [Floater](https://esolangs.org/wiki/Floater): `floater`
* [Foobar and Foobaz and Barbaz, oh my!](https://esolangs.org/wiki/Foobar_and_Foobaz_and_Barbaz,_oh_my!): `ffb`
* [Fugue](https://esolangs.org/wiki/Fugue): `fugue`
* [Glass](https://esolangs.org/wiki/Glass): `glass`
* [GolfScript](http://www.golfscript.com/golfscript/tutorial.html): `golfscript`
* [goruby](https://github.com/ruby/ruby/blob/trunk/man/goruby.1): `goruby`
* [GOTO 10](https://esolangs.org/wiki/GOTO_10): `goto10`
* [Grass](http://www.blue.sky.or.jp/grass/): `grass`
* [gs2](https://github.com/nooodl/gs2): `gs2`
* [Haystack](https://github.com/kade-robertson/haystack): `haystack`
* [Half-Broken Car in Heavy Traffic](https://esolangs.org/wiki/Half-Broken_Car_in_Heavy_Traffic): `hbcht`
* [Hexagony](https://github.com/m-ender/hexagony): `hexagony`
* [INTERCAL](https://en.wikipedia.org/wiki/INTERCAL): `intercal`
* [Japt](https://github.com/ETHproductions/japt): `japt`
* [Jelly](https://github.com/DennisMitchell/jelly): `jelly`
* [Jellyfish](https://github.com/iatorm/jellyfish): `jellyfish`
* [Labyrinth](https://github.com/m-ender/labyrinth): `labyrinth`
* [Logicode](https://github.com/LogicodeLang/Logicode): `logicode`
* [LOLCODE](http://lolcode.org/): `lolcode`
* [Malbolge](https://esolangs.org/wiki/Malbolge): `malbolge`
* [MATL](https://github.com/lmendo/MATL): `matl`
* [Minimal-2D](https://esolangs.org/wiki/Minimal-2D): `minimal2d`
* [Minus](http://www.golfscript.com/minus/): `minus`
* [ModanShogi](https://github.com/yhara/ShogiModan): `modanshogi`
* [~English](https://github.com/AnotherTest/-English): `notenglish`
* [PATH](http://pathlang.sourceforge.net/): `path`
* [Piet](http://www.dangermouse.net/esoteric/piet.html): `piet`
* [PPAP](https://github.com/yhara/ppap-lang): `ppap`
* [Pure Folders](https://esolangs.org/wiki/Folders#Pure_Folders): `pure-folders`
* [Rail](https://esolangs.org/wiki/Rail): `rail`
* [Recurse](https://esolangs.org/wiki/Recurse): `recurse`
* [Seed](https://esolangs.org/wiki/Seed): `seed`
* [///](https://esolangs.org/wiki////): `slashes`
* [Snowman](https://github.com/KeyboardFire/snowman-lang): `snowman`
* [Shakespeare](http://shakespearelang.sourceforge.net/): `spl`
* [Stack Cats](https://github.com/m-ender/stackcats): `stackcats`
* [Starry](https://esolangs.org/wiki/Starry): `starry`
* [Stuck](https://esolangs.org/wiki/Stuck): `stuck`
* [Toadskin](https://esolangs.org/wiki/Toadskin): `toadskin`
* [TrumpScript](http://samshadwell.me/TrumpScript/): `trumpscript`
* [UberGenes](https://esolangs.org/wiki/UberGenes): `ubergenes`
* [Unlambda](http://www.madore.org/~david/programs/unlambda/): `unlambda`
* [Unreadable](https://esolangs.org/wiki/Unreadable): `unreadable`
* [Velato](https://github.com/rottytooth/Velato): `velato`
* [Vim](http://www.vim.org/): `vim`
* [Whitespace](https://esolangs.org/wiki/Whitespace): `whitespace`
* [Wierd](http://catseye.tc/node/Wierd.html): `wierd`
* [Word!CPU](https://esolangs.org/wiki/Word!CPU): `wordcpu`
* [Z80](https://sites.google.com/site/codegolfingtips/Home/z80): `z80`
* [ZOMBIE](http://www.dangermouse.net/esoteric/zombie.html): `zombie`
* [Zucchini](https://esolangs.org/wiki/Zucchini): `zucchini`

## Build docker image

	$ cd /path/to/esolang-box
	$ docker build -t esolang-box .

### Debug mode

	$ docker build -t test --build-arg debug=true .

## Run spec

Tested with Ruby 2.4.0

	$ bundle install
	$ bundle exec rspec

## Development Memo

```sh
sudo yum update -y
sudo yum install -y docker git openssl-devel readline-devel zlib-devel
sudo yum groupinstall -y "Development Tools"
sudo service docker start
sudo usermod -a -G docker ec2-user
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install 2.4.0
rbenv global 2.4.0
gem install bundler
git clone https://github.com/hakatashi/dotfiles.git
ln -s dotfiles/.gitconfig
wget https://github.com/jwilder/docker-squash/releases/download/v0.2.0/docker-squash-linux-amd64-v0.2.0.tar.gz
sudo tar -C /usr/local/bin -xzvf docker-squash-linux-amd64-v0.2.0.tar.gz
git clone https://github.com/hakatashi/esolang-box.git
cd esolang-box
bundle install
```
