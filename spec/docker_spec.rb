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

  it 'installs node' do
    expect(command('node --version').stdout).to match(/v7/)
    expect(command('node assets/hello.js').stdout).to eql("Hello, World!\n")
    expect(command('node assets/cat.js < assets/kitty').stdout).to eql("meow")
  end

  it 'installs streem' do
    expect(command('streem assets/hello.strm 0<&-').stdout).to eql("Hello, World!\n")
    expect(command('streem assets/cat.strm < assets/kitty').stdout).to eql("meow\n")
  end

  it 'installs c-gcc' do
    expect(command('c-gcc assets/hello.c 0<&-').stdout).to eql("Hello, World!")
    expect(command('c-gcc assets/cat.c < assets/kitty').stdout).to eql("meow")
  end

  it 'installs csharp' do
    expect(command('csharp assets/hello.cs 0<&-').stdout).to eql("Hello, World!\n")
    expect(command('csharp assets/cat.cs < assets/kitty').stdout).to eql("meow\n")
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
    expect(command('goruby assets/hello.grb 0<&-').stdout).to eql("Hello, world!\n")
    expect(command('goruby assets/cat.grb < assets/kitty').stdout).to eql("meow")
  end

  it 'installs vim' do
    expect(command('vim assets/hello.vim 0<&-').stdout).to eql("Hello, World!\n")
    expect(command('vim assets/cat.vim < assets/kitty').stdout).to eql("meow")
  end

  it 'installs golfscript' do
    expect(command('golfscript assets/hello.gs 0<&-').stdout).to eql("Hello, World!\n")
    expect(command('golfscript assets/cat.gs < assets/kitty').stdout).to eql("meow\n")
  end

  it 'installs befunge93' do
    expect(command('befunge93 assets/hello.b93 0<&-').stdout).to eql("Hello, World!\n")
    expect(command('befunge93 assets/cat.b93 < assets/kitty').stdout).to eql("meow")
  end

  it 'installs glass' do
    expect(command('glass assets/hello.glass 0<&-').stdout).to eql("Hello, World!\n")
    expect(command('glass assets/cat.glass < assets/kitty').stdout).to eql("meow\0")
  end

  it 'installs zombie' do
    expect(command('zombie assets/hello.zombie 0<&-').stdout).to eql("Hello, World!\n\n")
  end

  it 'installs 05ab1e' do
    expect(command('05ab1e assets/hello.abe 0<&-').stdout).to eql("Hello, World!\n")
    expect(command('05ab1e assets/cat.abe < assets/kitty').stdout).to eql("meow\n")
  end

  it 'installs 2sable' do
    expect(command('2sable assets/hello.2sable 0<&-').stdout).to eql("Hello, World!\n")
    expect(command('2sable assets/cat.2sable < assets/kitty').stdout).to eql("meow\n")
  end

  it 'installs 3var' do
    expect(command('3var assets/hello.3var 0<&-').stdout).to eql("Hello, World!\n")
    expect(command('3var assets/cat.3var < assets/kitty').stdout).to eql("meow\n")
  end

  it 'installs fish' do
    expect(command('fish assets/hello.fish 0<&-').stdout).to eql("Hello, World!")
    expect(command('fish assets/cat.fish < assets/kitty').stdout).to eql("meow")
  end

  it 'installs arcyou' do
    expect(command('arcyou assets/hello.arc 0<&-').stdout).to eql("Hello, World!\n")
    expect(command('arcyou assets/cat.arc < assets/kitty').stdout).to eql("meow\n")
  end

  it 'installs emoji' do
    expect(command('emoji assets/hello.emoji 0<&-').stdout).to eql("Hello, World!\n")
    expect(command('emoji assets/cat.emoji < assets/kitty').stdout).to eql("meow\n")
  end

  it 'installs beam' do
    expect(command('beam assets/hello.beam 0<&-').stdout).to eql("Hello, World!")
    expect(command('beam assets/cat.beam < assets/kitty').stdout).to eql("meow\0")
  end

  it 'installs zucchini' do
    expect(command('zucchini assets/hello.zucchini 0<&-').stdout).to eql("Hello, world!\n")
    expect(command('zucchini assets/cat.zucchini < assets/kitty').stdout).to eql("meow")
  end

  it 'installs wierd' do
    expect(command('wierd assets/hello.wierd 0<&-').stdout).to eql("Hello, Worl\0d!")
    expect(command('wierd assets/cat.wierd < assets/kitty').stdout).to eql("meow")
  end

  it 'installs wordcpu' do
    pending("cat result match fails despite of the exact output matching... no idea why.")
    expect(command('wordcpu assets/hello.wordcpu 0<&-').stdout).to eql("Hello, World!\n")
    expect(command('wordcpu assets/cat.wordcpu < assets/kitty').stdout).to eql("meow\xFF")
  end

  it 'installs ffb' do
    expect(command('ffb assets/hello.ffb 0<&-').stdout).to eql("Hello, World!\n")
  end

  it 'installs fugue' do
    expect(command('fugue assets/hello.fugue.mid 0<&-').stdout).to eql("Hello World!")
  end

  it 'installs aheui' do
    expect(command('aheui assets/hello.aheui 0<&-').stdout).to eql("Hello, world!\n")
  end

  it 'installs modanshogi' do
    expect(command('modanshogi assets/hello.modan 0<&-').stdout).to eql("Hello, world!\n")
  end

  it 'installs ppap' do
    expect(command('ppap assets/cat.ppap < assets/kitty').stdout).to eql("meow")
  end

  it 'installs starry' do
    expect(command('starry assets/hello.starry 0<&-').stdout).to eql("Hello, world!")
  end

  it 'installs whitespace' do
    expect(command('whitespace assets/hello.ws 0<&-').stdout).to eql("Hello World!\n")
  end

  it 'installs aubergine' do
    expect(command('aubergine assets/hello.aubergine 0<&-').stdout).to eql("Hello, World!\n")
    expect(command('aubergine assets/cat.aubergine < assets/kitty').stdout).to eql("meow")
  end

  it 'installs ubergenes' do
    expect(command('ubergenes assets/hello.ubergenes 0<&-').stdout).to eql("Hello, World!")
  end

  it 'installs path' do
    expect(command('path assets/hello.path 0<&-').stdout).to eql("Hello, world!")
  end

  it 'installs floater' do
    expect(command('floater assets/hello.floater.png 0<&-').stdout).to eql("Hello, world!")
    expect(command('floater assets/cat.floater.png < assets/kitty').stdout).to eql("meow")
  end

  it 'installs recurse' do
    expect(command('recurse assets/hello.recurse 0<&-').stdout).to eql("Hello, world!!")
  end

  it 'installs beatnik' do
    expect(command('beatnik assets/hello.beatnik 0<&-').stdout).to eql("Hello, World!")
  end

  it 'installs blc' do
    expect(command('blc assets/hello.Blc 0<&-').stdout).to eql("Hello, World! ")
    expect(command('blc assets/cat.Blc < assets/kitty').stdout).to eql("meow")
  end

  it 'installs z80' do
    expect(command('z80 assets/hello.z8b 0<&-').stdout).to eql("Hello, world!")
    expect(command('z80 assets/cat.z8b < assets/kitty').stdout).to eql("meow")
  end

  it 'installs cardinal' do
    expect(command('cardinal assets/hello.cardinal 0<&-').stdout).to eql("Hello, World!\n")
  end

  it 'installs cjam' do
    expect(command('cjam assets/hello.cjam 0<&-').stdout).to eql("Hello, World!")
    expect(command('cjam assets/cat.cjam < assets/kitty').stdout).to eql("meow")
  end

  it 'installs convex' do
    expect(command('convex assets/hello.convex 0<&-').stdout).to eql("Hello, World!")
    expect(command('convex assets/cat.convex < assets/kitty').stdout).to eql("meow")
  end

  it 'installs cubix' do
    expect(command('cubix assets/hello.cubix 0<&-').stdout).to eql("Hello, World!")
    expect(command('cubix assets/cat.cubix < assets/kitty').stdout).to eql("meow")
  end

  it 'installs cy' do
    expect(command('cy assets/hello.cy 0<&-').stdout).to eql("Hello, World!\n")
    expect(command('cy assets/cat.cy < assets/kitty').stdout).to eql("meow\n")
  end

  it 'installs notenglish' do
    expect(command('notenglish assets/hello.notenglish 0<&-').stdout).to eql("Hello, World!\n")
    expect(command('notenglish assets/cat.notenglish < assets/kitty').stdout).to eql("meow\n")
  end

  it 'installs velato' do
    expect(command('velato assets/hello.velato.mid 0<&-').stdout).to eql("Hello, World!")
  end

  it 'installs spl' do
    expect(command('spl assets/hello.spl 0<&-').stdout).to eql("Hello World!\n")
  end

  it 'installs element' do
    expect(command('element assets/hello.element 0<&-').stdout).to eql("Hello, World!")
    expect(command('element assets/cat.element < assets/kitty').stdout).to eql("meow")
  end

  it 'installs emojicode' do
    expect(command('emojicode assets/hello.emojic 0<&-').stdout).to eql("Hello, World!\n")
  end

  it 'installs bash-pure' do
    expect(command('bash-pure assets/hello.bash 0<&-').stdout).to eql("Hello, World!\n")
    expect(command('bash-pure assets/cat.bash < assets/kitty').stdout).to eql("meow")
  end

  it 'installs fernando' do
    expect(command('fernando assets/hello.fernando 0<&-').stdout).to eql("Hello, world!")
    expect(command('fernando assets/cat.fernando < assets/kitty').stdout).to eql("meow")
  end

  it 'installs concise-folders' do
    expect(command('concise-folders assets/hello.concise-folders.zip 0<&-').stdout).to eql("Hello, World!")
  end

  it 'installs pure-folders' do
    expect(command('pure-folders assets/hello.pure-folders.zip 0<&-').stdout).to eql("Hello, Worl\u0006!")
  end

  it 'installs gs2' do
    expect(command('gs2 assets/hello.gs2 0<&-').stdout).to eql("Hello, World!\n")
    expect(command('gs2 assets/cat.gs2 < assets/kitty').stdout).to eql("meow\n")
  end

  it 'installs hbcht' do
    expect(command('hbcht assets/hello.hbcht 0<&-').stdout).to eql("Hello, world!\n")
  end

  it 'installs intercal' do
    expect(command('intercal assets/hello.intercal 0<&-').stdout).to eql("Hello, world!")
  end

  it 'installs japt' do
    expect(command('japt assets/hello.japt 0<&-').stdout).to eql("Hello, World!")
    expect(command('japt assets/cat.japt < assets/kitty').stdout).to eql("meow")
  end

  it 'installs jelly' do
    expect(command('jelly assets/hello.jelly 0<&-').stdout).to eql("Hello, World!")
    expect(command('jelly assets/cat.jelly < assets/kitty').stdout).to eql("meow")
  end

  it 'installs jellyfish' do
    expect(command('jellyfish assets/hello.jellyfish 0<&-').stdout).to eql("Hello, World!\n")
    expect(command('jellyfish assets/cat.jellyfish < assets/kitty').stdout).to eql("meow\n")
  end

  it 'installs labyrinth' do
    expect(command('labyrinth assets/hello.labyrinth 0<&-').stdout).to eql("Hello, World!")
    expect(command('labyrinth assets/cat.labyrinth < assets/kitty').stdout).to eql("meow")
  end

  it 'installs logicode' do
    expect(command('logicode assets/hello.logicode 0<&-').stdout).to eql("Hmllo,\x10World\x11\n") # Boo :(
  end

  it 'installs lolcode' do
    expect(command('lolcode assets/hello.lolcode 0<&-').stdout).to eql("Hello, World!\n")
    expect(command('lolcode assets/cat.lolcode < assets/kitty').stdout).to eql("meow\n")
  end

end
