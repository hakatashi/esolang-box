# esolang-box [![Build Status][travis-image]][travis-url]

[travis-image]: https://travis-ci.org/hakatashi/esolang-box.svg?branch=master
[travis-url]: https://travis-ci.org/hakatashi/esolang-box

Esolang value pack in a Docker image.

## Run built-in esolang program

	$ docker run hakatashi/esolang-box hexagony assets/hello.hxg
	Hello, World!

## Run your own esolang program

	$ docker run -v `pwd`:/code:ro hakatashi/esolang-box hexagony /code/program.hxg

## Build docker image

	$ cd /path/to/esolang-box
	$ docker build -t esolang-box .

## Run spec

Tested with Ruby 2.4.0

	$ bundle install
	$ bundle exec rspec

## Languages

### Practical Languages

* [Perl](https://www.perl.org/): `perl`
* [Python 1](https://www.python.org/): `python1`
* [Python 2](https://www.python.org/): `python`, `python2`, `python2.7`
* [Python 3](https://www.python.org/): `python3`, `python3.5`
* [Ruby 1.8](https://www.ruby-lang.org/): `ruby`, `ruby1.8`
* [Ruby 2.4](https://www.ruby-lang.org/): `ruby2.4`

### Esoteric Languages

* [ArnoidC](http://lhartikk.github.io/ArnoldC/): `arnoidc`
* [Axo](https://esolangs.org/wiki/Axo): `axo`
* [Befunge-98](https://esolangs.org/wiki/Befunge): `befunge98`
* [Dis](https://esolangs.org/wiki/Dis): `dis`
* [Evil](https://esolangs.org/wiki/Evil): `evil`
* [GOTO 10](https://esolangs.org/wiki/GOTO_10): `goto10`
* [Grass](http://www.blue.sky.or.jp/grass/): `grass`
* [Haystack](https://github.com/kade-robertson/haystack): `haystack`
* [Hexagony](https://github.com/m-ender/hexagony): `hexagony`
* [Malbolge](https://esolangs.org/wiki/Malbolge): `malbolge`
* [Piet](http://www.dangermouse.net/esoteric/piet.html): `piet`
* [Rail](https://esolangs.org/wiki/Rail): `rail`
* [Seed](https://esolangs.org/wiki/Seed): `seed`
* [///](https://esolangs.org/wiki////): `slashes`
* [Snowman](https://github.com/KeyboardFire/snowman-lang): `snowman`
* [Stack Cats](https://github.com/m-ender/stackcats): `stackcats`
* [Stuck](https://esolangs.org/wiki/Stuck): `stuck`
* [Toadskin](https://esolangs.org/wiki/Toadskin): `toadskin`
* [TrumpScript](http://samshadwell.me/TrumpScript/): `trumpscript`
* [Unlambda](http://www.madore.org/~david/programs/unlambda/): `unlambda`
* [Unreadable](https://esolangs.org/wiki/Unreadable): `unreadable`

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
