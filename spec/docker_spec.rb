require "spec_helper"
require "timeout"

describe 'Dockerfile' do

  before(:all) do
    set :os, family: :ubuntu

    unless ENV['DOCKER_IMAGE'].nil?
      set :docker_image, ENV['DOCKER_IMAGE']
    else
      image = Docker::Image.build_from_dir('.')
      set :docker_image, image.id
    end
  end

  it 'installs ruby 1.8' do
    expect(package('ruby1.8')).to be_installed
    expect(command('ruby -v').stdout).to match(/ruby 1.8.7/)
    expect(command('ruby1.8 -v').stdout).to match(/ruby 1.8.7/)
    expect(command('ruby assets/hello.rb').stdout).to eql("Hello, World!\n")
  end

  it 'installs ruby 2.4' do
    expect(package('ruby2.4')).to be_installed
    expect(command('ruby2.4 -v').stdout).to match(/ruby 2.4.0/)
    expect(command('ruby2.4 assets/hello.rb').stdout).to eql("Hello, World!\n")
  end

  it 'installs python 1.0' do
    expect(command('python1 assets/hello.py').stdout).to eql("Hello, World!\n")
  end

  it 'installs python 2.7' do
    expect(command('python --version').stderr).to match(/Python 2.7/)
    expect(command('python2 --version').stderr).to match(/Python 2.7/)
    expect(command('python2.7 --version').stderr).to match(/Python 2.7/)
    expect(command('python assets/hello.py').stdout).to eql("Hello, World!\n")
  end

  it 'installs python 3.5' do
    expect(command('python3 --version').stdout).to match(/Python 3.5/)
    expect(command('python3.5 --version').stdout).to match(/Python 3.5/)
    expect(command('python3 assets/hello.py').stdout).to eql("Hello, World!\n")
  end

  it 'installs perl' do
    expect(command('perl --version').stdout).to match(/perl 5/)
    expect(command('perl assets/hello.pl').stdout).to eql("Hello, World!")
  end

  it 'installs hexagony' do
    expect(command('hexagony assets/hello.hxg').stdout).to eql('Hello, World!')
  end

  it 'installs unlambda' do
    expect(command('unlambda assets/hello.unlambda').stdout).to eql("Hello, World!\n")
  end

  it 'installs snowman' do
    expect(command('snowman assets/hello.snowman').stdout).to eql("Hello, World!")
  end

  it 'installs rail' do
    expect(command('rail assets/hello.rail').stdout).to eql("Hello, World!")
  end

  it 'installs stackcats' do
    expect(command('stackcats assets/hello.stackcats 0<&-').stdout).to eql("Hello, World!")
  end

  it 'installs trumpscript' do
    expect(command('trumpscript --shut-up assets/hello.tr').stdout).to eql("hello, world!\n")
  end

  it 'installs stuck' do
    expect(command('stuck assets/hello.stk').stdout).to eql("Hello, World!\n")
  end

  it 'installs arnoidc' do
    expect(command('arnoidc assets/hello.arnoidc').stdout).to eql("Hello, World!\n")
  end

  it 'installs evil' do
    expect(command('evil assets/hello.evil').stdout).to eql("Hello, World!")
  end

  it 'installs haystack' do
    expect(command('haystack assets/hello.haystack').stdout).to eql("Hello, World!\n")
  end

  it 'installs befunge98' do
    expect(command('befunge98 assets/hello.b98').stdout).to eql("Hello, World!")
  end

  it 'installs seed' do
    expect(command('seed assets/hello.seed').stdout).to eql("Hello, World!")
  end

  it 'installs piet' do
    expect(command('piet assets/hello.piet.png').stdout).to eql("Hello, World!")
  end

  it 'installs slashes' do
    expect(command('slashes assets/hello.slashes').stdout).to eql("Hello, World!")
  end

  it 'installs axo' do
    expect(command('axo assets/hello.axo').stdout).to eql("Hello, World!\n")
  end

  it 'installs goto10' do
    expect(command('goto10 assets/hello.goto10').stdout).to eql("Hello world!\n")
  end

  it 'installs unicat' do
    expect(command('unicat assets/hello.cat').stdout).to eql("Hello, World!\n")
  end

  it 'installs toadskin' do
    expect(command('toadskin assets/hello.toadskin').stdout).to eql("Hello World!\n")
  end

  it 'installs malbolge' do
    expect(command('malbolge assets/hello.malbolge').stdout).to eql("Hello, World!")
  end

  it 'installs dis' do
    expect(command('dis assets/hello.dis').stdout).to eql("Hello, world!\n")
  end

  it 'installs unreadable' do
    expect(command('unreadable assets/hello.unreadable').stdout).to eql("Hello, World!")
  end

  it 'installs grass' do
    expect(command('grass assets/hello.grass').stdout).to eql("Hello, World!\n")
  end

  it 'installs brainfuck' do
    expect(command('brainfuck assets/hello.bf 0<&-').stdout).to eql("Hello, World!")
    expect(command('brainfuck assets/cat.bf < assets/kitty').stdout).to eql("meow")
  end

  it 'installs goruby' do
    expect(command('goruby assets/hello.grb').stdout).to eql("Hello, world!\n")
    expect(command('goruby assets/cat.grb < assets/kitty').stdout).to eql("meow")
  end

  it 'installs vim' do
    expect(command('vim assets/hello.vim').stdout).to eql("Hello, World!")
    expect(command('vim assets/cat.vim < assets/kitty').stdout).to eql("meow")
  end

end
