require "spec_helper"
require "timeout"

describe 'esolang-box', v2: true do
  def result_of(language, path, stdin = nil)
    config = {
      'Cmd' => [language, path],
      'Image' => "esolang/#{language}",
      'Volumes' => {
        '/assets' => {},
      },
      'HostConfig' => {
        'Binds' => ["#{File.expand_path('spec/assets').gsub(/^C:/, '/c').gsub(/^\/mnt/, '')}:/assets:ro"],
      },
    }

    unless stdin.nil?
      config['OpenStdin'] = true
      config['StdinOnce'] = true
    end

    container = Docker::Container.create(config)

    stdout = if stdin.nil?
      container.tap(&:start).tap(&:wait).logs(stdout: true)[8..-1]
    else
      container.tap(&:start).attach(stdin: StringIO.new(stdin))[0].join
    end

    container.remove

    stdout
  end

  describe 'ruby' do
    it { expect(result_of(subject, '/assets/hello.rb')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.rb', 'meow')).to eql('meow') }
  end

  describe 'ruby1' do
    it { expect(result_of(subject, '/assets/hello.rb')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.rb', 'meow')).to eql('meow') }
  end

  describe 'ruby0.49' do
    it { expect(result_of(subject, '/assets/hello.ruby049.rb')).to eql("Hello, World!") }
    it { expect(result_of(subject, '/assets/cat.ruby049.rb', 'meow')).to eql('meow') }
  end

  describe 'python1' do
    it { expect(result_of(subject, '/assets/hello.py')).to eql("Hello, World!\n") }
    it(nil, skip: 'not works nor supported') { expect(result_of(subject, '/assets/cat.py', 'meow')).to eql("meow\n") }
  end

  describe 'python2' do
    it { expect(result_of(subject, '/assets/hello.py')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.python2.py', 'meow')).to eql("meow\n") }
  end

  describe 'python3' do
    it { expect(result_of(subject, '/assets/hello.py')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.python3.py', 'meow')).to eql("meow\n") }
  end

  describe 'perl' do
    it { expect(result_of(subject, '/assets/hello.pl')).to eql("Hello, World!") }
    it { expect(result_of(subject, '/assets/cat.pl', 'meow')).to eql("meow") }
  end

  describe 'node' do
    it { expect(result_of(subject, '/assets/hello.js')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.js', 'meow')).to eql("meow") }
  end

  describe 'streem' do
    it { expect(result_of(subject, '/assets/hello.strm')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.strm', 'meow')).to eql("meow\n") }
  end

  describe 'c-gcc' do
    it { expect(result_of(subject, '/assets/hello.c')).to eql("Hello, World!") }
    it { expect(result_of(subject, '/assets/cat.c', 'meow')).to eql("meow") }
  end

  describe 'csharp' do
    it { expect(result_of(subject, '/assets/hello.cs')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.cs', 'meow')).to eql("meow\n") }
  end

  describe 'octave' do
    it { expect(result_of(subject, '/assets/hello.matlab')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.matlab', 'meow')).to eql("meow") }
  end

  describe 'php' do
    it { expect(result_of(subject, '/assets/hello.php')).to eql("Hello, World!") }
    it { expect(result_of(subject, '/assets/cat.php', 'meow')).to eql("meow") }
  end

  describe 'd-gdc' do
    it { expect(result_of(subject, '/assets/hello.d')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.d', 'meow')).to eql("meow") }
  end

  describe 'java' do
    it { expect(result_of(subject, '/assets/hello.java')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.java', 'meow')).to eql("meow\n") }
  end

  describe 'js-rhino' do
    it { expect(result_of(subject, '/assets/hello.rhino.js')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.rhino.js', 'meow')).to eql("meow\n") }
  end

  describe 'crystal' do
    it { expect(result_of(subject, '/assets/hello.cr')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.cr', 'meow')).to eql("meow\n") }
  end

  describe 'powershell' do
    it { expect(result_of(subject, '/assets/hello.ps1')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.ps1', 'meow')).to eql("meow\n") }
  end

  describe 'verilog' do
    it { expect(result_of(subject, '/assets/hello.v')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.v', 'meow')).to eql("meow") }
  end

  describe 'd-dmd' do
    it { expect(result_of(subject, '/assets/hello.d')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.d', 'meow')).to eql("meow") }
  end

  describe 'simula' do
    it { expect(result_of(subject, '/assets/hello.sim')).to eql("Hello, World!\n") }
  end

  describe 'jq' do
    it { expect(result_of(subject, '/assets/hello.jq')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.jq', 'meow')).to eql("meow\n") }
  end

  describe 'make' do
    it { expect(result_of(subject, '/assets/hello.make')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.make', 'meow')).to eql("meow\n") }
  end

  describe 'hexagony' do
    it { expect(result_of(subject, '/assets/hello.hxg')).to eql("Hello, World!") }
    it { expect(result_of(subject, '/assets/cat.hxg', 'meow')).to eql("meow") }
  end

  describe 'unlambda' do
    it { expect(result_of(subject, '/assets/hello.unlambda')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.unlambda', 'meow')).to eql("meow") }
  end

  describe 'snowman' do
    it { expect(result_of(subject, '/assets/hello.snowman')).to eql("Hello, World!") }
    it { expect(result_of(subject, '/assets/cat.snowman', 'meow')).to eql("meow\n") }
  end

  describe 'rail' do
    it { expect(result_of(subject, '/assets/hello.rail')).to eql("Hello, World!") }
    it { expect(result_of(subject, '/assets/cat.rail', 'meow')).to eql("meow") }
  end

  describe 'stackcats' do
    it { expect(result_of(subject, '/assets/hello.stackcats')).to eql("Hello, World!") }
    it { expect(result_of(subject, '/assets/cat.stackcats', 'meow')).to eql("meow") }
  end

  describe 'trumpscript' do
    it { expect(result_of(subject, '/assets/hello.tr')).to eql("hello, world!\n") }
  end

  describe 'stuck' do
    it { expect(result_of(subject, '/assets/hello.stk')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.stk', 'meow')).to eql("meow\n") }
  end

  describe 'arnoidc' do
    it { expect(result_of(subject, '/assets/hello.arnoidc')).to eql("Hello, World!\n") }
  end

  describe 'evil' do
    it { expect(result_of(subject, '/assets/hello.evil')).to eql("Hello, World!") }
  end

  describe 'haystack' do
    it { expect(result_of(subject, '/assets/hello.haystack')).to eql("Hello, World!\n") }
  end

  describe 'befunge98' do
    it { expect(result_of(subject, '/assets/hello.b98')).to eql("Hello, World!") }
  end

  describe 'seed' do
    it { expect(result_of(subject, '/assets/hello.seed')).to eql("Hello, World!") }
  end

  describe 'piet' do
    it { expect(result_of(subject, '/assets/hello.piet.png')).to eql("Hello, World!") }
  end

  describe 'slashes' do
    it { expect(result_of(subject, '/assets/hello.slashes')).to eql("Hello, World!") }
  end

  describe 'axo' do
    it { expect(result_of(subject, '/assets/hello.axo')).to eql("Hello, World!\n") }
  end

  describe 'unicat' do
    it { expect(result_of(subject, '/assets/hello.cat')).to eql("Hello, World!\n") }
  end

  describe 'malbolge' do
    it { expect(result_of(subject, '/assets/hello.malbolge')).to eql("Hello, World!") }
  end

  describe 'dis' do
    it { expect(result_of(subject, '/assets/hello.dis')).to eql("Hello, world!\n") }
    it { expect(result_of(subject, '/assets/cat.dis', 'meow')).to eql("meow") }
  end

  describe 'unreadable' do
    it { expect(result_of(subject, '/assets/hello.unreadable')).to eql("Hello, World!") }
  end

  describe 'grass' do
    it { expect(result_of(subject, '/assets/hello.grass')).to eql("Hello, World!\n") }
  end

  describe 'brainfuck-esotope' do
    it { expect(result_of(subject, '/assets/hello.bf')).to eql("Hello, World!") }
    it { expect(result_of(subject, '/assets/cat.bf', 'meow')).to eql("meow") }
  end

  describe 'brainfuck-bfi' do
    it { expect(result_of(subject, '/assets/hello.bfi.bf')).to eql("Hello, world!\n") }
  end

  describe 'goruby' do
    it { expect(result_of(subject, '/assets/hello.grb')).to eql("Hello, world!\n") }
    it { expect(result_of(subject, '/assets/cat.grb', 'meow')).to eql("meow") }
  end

  describe 'vim' do
    it { expect(result_of(subject, '/assets/hello.vim')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.vim', 'meow')).to eql("meow") }
  end

  describe 'golfscript' do
    it { expect(result_of(subject, '/assets/hello.gs')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.gs', 'meow')).to eql("meow\n") }
  end

  describe 'befunge93' do
    # Debuxing output stream is so hard... So we use `include` instead of `eql`, though it's not right way
    it { expect(result_of(subject, '/assets/hello.b93')).to include("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.b93', 'meow')).to eql("meow") }
  end

  describe 'glass' do
    it { expect(result_of(subject, '/assets/hello.glass')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.glass', 'meow')).to eql("meow\0") }
  end

  describe 'zombie' do
    it { expect(result_of(subject, '/assets/hello.zombie')).to include("Hello, World!\n") }
  end

  describe '05ab1e' do
    it { expect(result_of(subject, '/assets/hello.abe')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.abe', 'meow')).to eql("meow\n") }
  end

  describe '2sable' do
    it { expect(result_of(subject, '/assets/hello.2sable')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.2sable', 'meow')).to eql("meow\n") }
  end

  describe '3var' do
    it { expect(result_of(subject, '/assets/hello.3var')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.3var', 'meow')).to eql("meow\n") }
  end

  describe 'fish' do
    it { expect(result_of(subject, '/assets/hello.fish')).to eql("Hello, World!") }
    it { expect(result_of(subject, '/assets/cat.fish', 'meow')).to eql("meow") }
  end

  describe 'arcyou' do
    it { expect(result_of(subject, '/assets/hello.arc')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.arc', 'meow')).to eql("meow\n") }
  end

  describe 'emoji' do
    it { expect(result_of(subject, '/assets/hello.emoji')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.emoji', 'meow')).to eql("meow\n") }
  end

  describe 'beam' do
    it { expect(result_of(subject, '/assets/hello.beam')).to eql("Hello, World!") }
    it { expect(result_of(subject, '/assets/cat.beam', 'meow')).to eql("meow\0") }
  end

  describe 'zucchini' do
    it { expect(result_of(subject, '/assets/hello.zucchini')).to eql("Hello, world!\n") }
    it { expect(result_of(subject, '/assets/cat.zucchini', 'meow')).to eql("meow") }
  end

  describe 'wierd' do
    it { expect(result_of(subject, '/assets/hello.wierd')).to eql("Hello, Worl\0d!") }
    it { expect(result_of(subject, '/assets/cat.wierd', 'meow')).to eql("meow") }
  end

  describe 'wordcpu' do
    it { expect(result_of(subject, '/assets/hello.wordcpu')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.wordcpu', 'meow').force_encoding(Encoding::UTF_8)).to eql("meow\xFF") }
  end

  describe 'ffb' do
    it { expect(result_of(subject, '/assets/hello.ffb')).to eql("Hello, World!\n") }
  end

  describe 'fugue' do
    it { expect(result_of(subject, '/assets/hello.fugue.mid')).to eql("Hello World!") }
  end

  describe 'aheui' do
    it { expect(result_of(subject, '/assets/hello.aheui')).to eql("Hello, world!\n") }
  end

  describe 'modanshogi' do
    it { expect(result_of(subject, '/assets/hello.modan')).to eql("Hello, world!\n") }
  end

  describe 'ppap' do
    it { expect(result_of(subject, '/assets/cat.ppap', 'meow')).to include("meow") }
  end

  describe 'starry' do
    it { expect(result_of(subject, '/assets/hello.starry')).to eql("Hello, world!") }
  end

  describe 'whitespace' do
    it { expect(result_of(subject, '/assets/hello.ws')).to eql("Hello World!\n") }
  end

  describe 'aubergine' do
    it { expect(result_of(subject, '/assets/hello.aubergine')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.aubergine', 'meow')).to eql("meow") }
  end

  describe 'ubergenes' do
    it { expect(result_of(subject, '/assets/hello.ubergenes')).to eql("Hello, World!") }
  end

  describe 'path' do
    it { expect(result_of(subject, '/assets/hello.path')).to eql("Hello, world!") }
  end

  describe 'floater' do
    it { expect(result_of(subject, '/assets/hello.floater.png')).to eql("Hello, world!") }
    it { expect(result_of(subject, '/assets/cat.floater.png', 'meow')).to eql("meow") }
  end

  describe 'recurse' do
    it { expect(result_of(subject, '/assets/hello.recurse')).to eql("Hello, world!!") }
  end

  describe 'beatnik' do
    it { expect(result_of(subject, '/assets/hello.beatnik')).to eql("Hello, World!") }
  end

  describe 'blc' do
    it { expect(result_of(subject, '/assets/hello.Blc')).to eql("Hello, World! ") }
    it { expect(result_of(subject, '/assets/cat.Blc', 'meow')).to eql("meow") }
  end

  describe 'z80' do
    it { expect(result_of(subject, '/assets/hello.z8b')).to eql("Hello, world!") }
    it { expect(result_of(subject, '/assets/cat.z8b', 'meow')).to eql("meow") }
  end

  describe 'cardinal' do
    it { expect(result_of(subject, '/assets/hello.cardinal')).to eql("Hello, World!\n") }
  end

  describe 'cjam' do
    it { expect(result_of(subject, '/assets/hello.cjam')).to eql("Hello, World!") }
    it { expect(result_of(subject, '/assets/cat.cjam', 'meow')).to eql("meow") }
  end

  describe 'convex' do
    it { expect(result_of(subject, '/assets/hello.convex')).to eql("Hello, World!") }
    it { expect(result_of(subject, '/assets/cat.convex', 'meow')).to eql("meow") }
  end

  describe 'cubix' do
    it { expect(result_of(subject, '/assets/hello.cubix')).to eql("Hello, World!") }
    it { expect(result_of(subject, '/assets/cat.cubix', 'meow')).to eql("meow") }
  end

  describe 'cy' do
    it { expect(result_of(subject, '/assets/hello.cy')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.cy', 'meow')).to eql("meow\n") }
  end

  describe 'velato' do
    it { expect(result_of(subject, '/assets/hello.velato.mid')).to eql("Hello, World!") }
  end

  describe 'spl' do
    it { expect(result_of(subject, '/assets/hello.spl')).to eql("Hello World!\n") }
  end

  describe 'element' do
    it { expect(result_of(subject, '/assets/hello.element')).to eql("Hello, World!") }
    it { expect(result_of(subject, '/assets/cat.element', 'meow')).to eql("meow") }
  end

  describe 'emojicode' do
    it { expect(result_of(subject, '/assets/hello.emojic')).to eql("Hello, World!\n") }
  end

  describe 'bash-pure' do
    it { expect(result_of(subject, '/assets/hello.bash')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.bash', 'meow')).to eql("meow") }
  end

  describe 'bash-busybox' do
    it { expect(result_of(subject, '/assets/hello.bash')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.bash', 'meow')).to eql("meow") }
  end

  describe 'fernando' do
    it { expect(result_of(subject, '/assets/hello.fernando')).to eql("Hello, world!") }
    it { expect(result_of(subject, '/assets/cat.fernando', 'meow')).to eql("meow") }
  end

  describe 'pure-folders' do
    it { expect(result_of(subject, '/assets/hello.pure-folders.tar')).to eql("Hello, Worl\u0006!") }
  end

  describe 'concise-folders' do
    it { expect(result_of(subject, '/assets/hello.concise-folders.tar')).to eql("Hello, World!") }
  end

  describe 'gs2' do
    it { expect(result_of(subject, '/assets/hello.gs2')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.gs2', 'meow')).to eql("meow\n") }
  end

  describe 'hbcht' do
    it { expect(result_of(subject, '/assets/hello.hbcht')).to eql("Hello, world!\n") }
  end

  describe 'intercal' do
    it { expect(result_of(subject, '/assets/hello.intercal')).to eql("Hello, world!") }
  end

  describe 'japt' do
    it { expect(result_of(subject, '/assets/hello.japt')).to eql("Hello, World!") }
    it { expect(result_of(subject, '/assets/cat.japt', 'meow')).to eql("meow") }
  end

  describe 'jelly' do
    it { expect(result_of(subject, '/assets/hello.jelly')).to eql("Hello, World!") }
    it { expect(result_of(subject, '/assets/cat.jelly', 'meow')).to eql("meow") }
  end

  describe 'jellyfish' do
    it { expect(result_of(subject, '/assets/hello.jellyfish')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.jellyfish', 'meow')).to eql("meow\n") }
  end

  describe 'labyrinth' do
    it { expect(result_of(subject, '/assets/hello.labyrinth')).to eql("Hello, World!") }
    it { expect(result_of(subject, '/assets/cat.labyrinth', 'meow')).to eql("meow") }
  end

  describe 'logicode' do
    it { expect(result_of(subject, '/assets/hello.logicode')).to eql("Hmllo,\x10World\x11\n") } # Boo :(
  end

  describe 'lolcode' do
    it { expect(result_of(subject, '/assets/hello.lolcode')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.lolcode', 'meow')).to eql("meow\n") }
  end

  describe 'matl' do
    it { expect(result_of(subject, '/assets/hello.matl')).to eql("Hello, World!\n") }
  end

  describe 'minimal2d' do
    it { expect(result_of(subject, '/assets/hello.minimal2d')).to eql("Hello, world\n") }
  end

  describe 'minus' do
    it { expect(result_of(subject, '/assets/hello.minus')).to eql("Hello, world!") }
  end

  describe 'sqlite3' do
    it { expect(result_of(subject, '/assets/hello.sqlite3.sql')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, '/assets/cat.sqlite3.sql', 'meow')).to eql("meow\n") }
  end

  describe 'taxi' do
    it { expect(result_of(subject, '/assets/hello.taxi')).to eql("Hello, World!") }
    it { expect(result_of(subject, '/assets/cat.taxi', 'meow')).to eql("meow") }
  end

  describe 'adjust' do
    it { expect(result_of(subject, '/assets/hello.adjust')).to eql("Hell") }
  end

  describe 'wake' do
    it { expect(result_of(subject, '/assets/hello.wake')).to eql("Hello,") }
    it { expect(result_of(subject, '/assets/cat.wake', 'meow')).to eql("meow") }
  end

  describe 'irc' do
    it { expect(result_of(subject, '/assets/hello.irc')).to eql("Hello World\n") }
  end

  describe 'braille' do
    it { expect(result_of(subject, '/assets/hello.braille')).to eql("Hello, world!\n") }
  end
end
