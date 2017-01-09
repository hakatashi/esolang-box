# esolang-box

Esolangs value pack in a Docker image.

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

* [Python 2](https://www.python.org/): `python`, `python2`, `python2.7`
* [Python 3](https://www.python.org/): `python3`, `python3.5`
* [Ruby](https://www.ruby-lang.org/): `ruby`, `ruby2.4`

### Esoteric Languages

* [ArnoidC](http://lhartikk.github.io/ArnoldC/): `arnoidc`
* [Evil](https://esolangs.org/wiki/Evil): `evil`
* [Hexagony](https://github.com/m-ender/hexagony): `hexagony`
* [Rail](https://esolangs.org/wiki/Rail): `rail`
* [Snowman](https://github.com/KeyboardFire/snowman-lang): `snowman`
* [Stack Cats](https://github.com/m-ender/stackcats): `stackcats`
* [Stuck](https://esolangs.org/wiki/Stuck): `stuck`
* [TrumpScript](http://samshadwell.me/TrumpScript/): `trumpscript`
* [Unlambda](http://www.madore.org/~david/programs/unlambda/): `unlambda`

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
git clone https://github.com/hakatashi/esolang-box.git
cd esolang-box
bundle install
```
