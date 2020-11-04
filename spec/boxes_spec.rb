require "spec_helper"
require "timeout"
require "fileutils"

ENABLE_STRACE = !ENV['ENABLE_STRACE'].nil?

describe 'esolang-box', v2: true do
  def result_of(language, file, stdin = nil)
    FileUtils.mkdir_p 'spec/tmp'
    FileUtils.cp File.join('spec/assets', file), 'spec/tmp/CODE'

    config = {
      'Cmd' => [language, '/volume/CODE'],
      'Image' => "esolang/#{language}",
      'NetworkDisabled' => true,
      'Volumes' => {
        '/assets' => {},
      },
      'HostConfig' => {
        'Binds' => ["#{File.expand_path('spec/tmp').gsub(/^C:/, '/c').gsub(/^\/mnt/, '')}:/volume#{ENABLE_STRACE ? '' : ':ro'}"],
      },
    }

    unless stdin.nil?
      config['OpenStdin'] = true
      config['StdinOnce'] = true
    end

    if ENABLE_STRACE
      config['ENV'] = ['STRACE_OUTPUT_PATH=/volume/strace.log']
      config['HostConfig']['CapAdd'] = ['SYS_PTRACE']
    end

    container = Docker::Container.create(config)
    container.start

    starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)

    begin
      stdout = if stdin.nil?
        container.wait 180
        container.logs(stdout: true)[8..-1]
      else
        container.attach(stdin: StringIO.new(stdin))[0].join
      end
    rescue
      raise $!
    ensure
      container.kill
      container.remove
    end

    ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)

    if ENABLE_STRACE
      FileUtils.mkdir_p 'spec/strace'
      FileUtils.cp 'spec/tmp/strace.log', File.join('spec/strace', "#{language}_#{file.split('.').first}.log")
      File.write File.join('spec/strace', "#{language}_#{file.split('.').first}.txt"), "elapsed: #{ending - starting}"
    end

    FileUtils.remove_dir 'spec/tmp', true

    stdout
  end

  describe 'ruby' do
    it { expect(result_of(subject, 'hello.rb')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.rb', 'meow')).to eql('meow') }
  end

  describe 'ruby1' do
    it { expect(result_of(subject, 'hello.rb')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.rb', 'meow')).to eql('meow') }
  end

  describe 'ruby0.49' do
    it { expect(result_of(subject, 'hello.ruby049.rb')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.ruby049.rb', 'meow')).to eql('meow') }
  end

  describe 'ruby-trunk' do
    it { expect(result_of(subject, 'hello.rb')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.rb', "meow")).to eql("meow") }
  end

  describe 'python1' do
    it { expect(result_of(subject, 'hello.py')).to eql("Hello, World!\n") }
    it(nil, skip: 'not works nor supported') { expect(result_of(subject, 'cat.py', 'meow')).to eql("meow\n") }
  end

  describe 'python2' do
    it { expect(result_of(subject, 'hello.py')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.python2.py', 'meow')).to eql("meow\n") }
  end

  describe 'python3' do
    it { expect(result_of(subject, 'hello.py')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.python3.py', 'meow')).to eql("meow\n") }
  end

  describe 'perl' do
    it { expect(result_of(subject, 'hello.pl')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.pl', 'meow')).to eql("meow") }
  end

  describe 'perl1' do
    it { expect(result_of(subject, 'hello.pl')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.pl', 'meow')).to eql("meow") }
  end

  describe 'node' do
    it { expect(result_of(subject, 'hello.js')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.js', 'meow')).to eql("meow") }
  end

  describe 'streem' do
    it { expect(result_of(subject, 'hello.strm')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.strm', 'meow')).to eql("meow\n") }
  end

  describe 'c-gcc' do
    it { expect(result_of(subject, 'hello.c')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.c', 'meow')).to eql("meow") }
  end

  describe 'csharp' do
    it { expect(result_of(subject, 'hello.cs')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.cs', 'meow')).to eql("meow\n") }
  end

  describe 'csharp-dotnet' do
    it { expect(result_of(subject, 'hello.cs')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.cs', 'meow')).to eql("meow\n") }
  end

  describe 'fsharp-dotnet' do
    it { expect(result_of(subject, 'hello.fs')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.fs', 'meow')).to eql("meow\n") }
  end

  describe 'octave' do
    it { expect(result_of(subject, 'hello.matlab')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.matlab', 'meow')).to eql("meow") }
  end

  describe 'php' do
    it { expect(result_of(subject, 'hello.php')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.php', 'meow')).to eql("meow") }
  end

  describe 'd-gdc' do
    it { expect(result_of(subject, 'hello.d')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.d', 'meow')).to eql("meow") }
  end

  describe 'osecpu' do
    it { expect(result_of(subject, 'hello.ose')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.ose', 'meowoo')).to eql("meowoo\n") }
  end

  describe 'osecpu-aska' do
    it { expect(result_of(subject, 'hello.ask')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.ask', 'meowoo')).to eql("meowoo\n") }
  end

  describe 'java' do
    it { expect(result_of(subject, 'hello.java')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.java', 'meow')).to eql("meow\n") }
  end

  describe 'js-rhino' do
    it { expect(result_of(subject, 'hello.rhino.js')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.rhino.js', 'meow')).to eql("meow\n") }
  end

  describe 'crystal' do
    it { expect(result_of(subject, 'hello.cr')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.cr', 'meow')).to eql("meow\n") }
  end

  describe 'powershell' do
    it { expect(result_of(subject, 'hello.ps1')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.ps1', 'meow')).to eql("meow\n") }
  end

  describe 'verilog' do
    it { expect(result_of(subject, 'hello.v')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.v', 'meow')).to eql("meow") }
  end

  describe 'd-dmd' do
    it { expect(result_of(subject, 'hello.d')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.d', 'meow')).to eql("meow") }
  end

  describe 'simula' do
    it { expect(result_of(subject, 'hello.sim')).to eql("Hello, World!\n") }
  end

  describe 'jq' do
    it { expect(result_of(subject, 'hello.jq')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.jq', 'meow')).to eql("meow\n") }
  end

  describe 'make' do
    it { expect(result_of(subject, 'hello.make')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.make', 'meow')).to eql("meow\n") }
  end

  describe 'x86asm-nasm' do
    it { expect(result_of(subject, 'hello.x86.asm')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.x86.asm', 'meow')).to eql("meow") }
  end

  describe 'i4004asm' do
    it { expect(result_of(subject, 'hello.i4004.asm')).to eql("Hello, World!\r\n") }
    it { expect(result_of(subject, 'cat.i4004.asm', 'meow')).to eql("meow") }
  end

  describe 'rust' do
    it { expect(result_of(subject, 'hello.rs')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.rs', 'meow')).to eql("meow") }
  end

  describe 'nadesiko' do
    it { expect(result_of(subject, 'hello.nako3')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.nako3', 'meow')).to eql("meow\n") }
  end

  describe 'cmd' do
    it { expect(result_of(subject, 'hello.bat')).to eql("Hello, World!\r\n") }
    it { expect(result_of(subject, 'cat.bat', 'meow')).to eql("meow") }
  end

  describe 'kotlin' do
    it { expect(result_of(subject, 'hello.kt')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.kt', 'meow')).to eql("meow\n") }
  end

  describe 'wat' do
    it { expect(result_of(subject, 'hello.wat')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.wat', 'meow')).to eql("meow") }
  end

  describe 'llvm-ir' do
    it { expect(result_of(subject, 'hello.ll')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.ll', 'meow')).to eql("meow\n") }
  end

  describe 'lua' do
    it { expect(result_of(subject, 'hello.lua')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.lua', 'meow')).to eql("meow") }
  end

  describe 'ocaml' do
    it { expect(result_of(subject, 'hello.ml')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.ml', 'meow')).to eql("meow") }
  end

  describe 'swift' do
    it { expect(result_of(subject, 'hello.swift')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.swift', 'meow')).to eql("meow\n") }
  end

  describe 'cpp-clang' do
    it { expect(result_of(subject, 'hello.cpp')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.c', 'meow')).to eql("meow") }
  end

  describe 'haskell' do
    it { expect(result_of(subject, 'hello.hs')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.hs', 'meow')).to eql('meow') }
  end

  describe 'erlang' do
    it { expect(result_of(subject, 'hello.erl')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.erl', 'meow')).to eql('meow') }
  end

  describe 'elixir' do
    it { expect(result_of(subject, 'hello.exs')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.exs', 'meow')).to eql('meow') }
  end

  describe 'fish-shell-pure' do
    it { expect(result_of(subject, 'hello.fish')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.fish', 'meow')).to eql("meow") }
  end

  describe 'oh' do
    it { expect(result_of(subject, 'hello.oh')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.oh', 'meow')).to eql("meow\n") }
  end

  describe 'zen' do
    it { expect(result_of(subject, 'hello.zen')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.zen', 'meow')).to eql("meow") }
  end

  describe 'rapira' do
    it { expect(result_of(subject, 'hello.rapira')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.rapira', '100')).to eql("100\n") }
  end

  describe 'vlang' do
    it { expect(result_of(subject, 'hello.vlang')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.vlang', 'meow')).to eql("meow\n") }
  end

  describe 'reasonml' do
    it { expect(result_of(subject, 'hello.re')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.re', 'meow')).to eql("meow\n") }
  end

  describe 'wren' do
    it { expect(result_of(subject, 'hello.wren')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.wren', 'meow')).to eql("meow\n") }
  end

  describe 'zsh-pure' do
    it { expect(result_of(subject, 'hello.zsh')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.zsh', 'meow')).to eql("meow") }
  end

  describe 'hexagony' do
    it { expect(result_of(subject, 'hello.hxg')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.hxg', 'meow')).to eql("meow") }
  end

  describe 'unlambda' do
    it { expect(result_of(subject, 'hello.unlambda')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.unlambda', 'meow')).to eql("meow") }
  end

  describe 'snowman' do
    it { expect(result_of(subject, 'hello.snowman')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.snowman', 'meow')).to eql("meow\n") }
  end

  describe 'rail' do
    it { expect(result_of(subject, 'hello.rail')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.rail', 'meow')).to eql("meow") }
  end

  describe 'stackcats' do
    it { expect(result_of(subject, 'hello.stackcats')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.stackcats', 'meow')).to eql("meow") }
  end

  describe('trumpscript', skip: 'not work with python3.8') do
    it { expect(result_of(subject, 'hello.tr')).to eql("hello, world!\n") }
  end

  describe 'stuck' do
    it { expect(result_of(subject, 'hello.stk')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.stk', 'meow')).to eql("meow\n") }
  end

  describe 'arnoidc' do
    it { expect(result_of(subject, 'hello.arnoidc')).to eql("Hello, World!\n") }
  end

  describe 'evil' do
    it { expect(result_of(subject, 'hello.evil')).to eql("Hello, World!") }
  end

  describe 'haystack' do
    it { expect(result_of(subject, 'hello.haystack')).to eql("Hello, World!\n") }
  end

  describe 'befunge98' do
    it { expect(result_of(subject, 'hello.b98')).to eql("Hello, World!") }
  end

  describe 'seed' do
    it { expect(result_of(subject, 'hello.seed')).to eql("Hello, World!") }
  end

  describe 'piet' do
    it { expect(result_of(subject, 'hello.piet.png')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.piet.png', 'meow')).to eql("meow") }
  end

  describe 'slashes' do
    it { expect(result_of(subject, 'hello.slashes')).to eql("Hello, World!") }
  end

  describe 'axo' do
    it { expect(result_of(subject, 'hello.axo')).to eql("Hello, World!\n") }
  end

  describe 'unicat' do
    it { expect(result_of(subject, 'hello.cat')).to eql("Hello, World!\n") }
  end

  describe 'malbolge' do
    it { expect(result_of(subject, 'hello.malbolge')).to eql("Hello, World!") }
  end

  xdescribe 'dis' do
    it { expect(result_of(subject, 'hello.dis')).to eql("Hello, world!\n") }
    it { expect(result_of(subject, 'cat.dis', 'meow')).to eql("meow") }
  end

  describe 'unreadable' do
    it { expect(result_of(subject, 'hello.unreadable')).to eql("Hello, World!") }
  end

  describe 'grass' do
    it { expect(result_of(subject, 'hello.grass')).to eql("Hello, World!\n") }
  end

  describe 'brainfuck-esotope' do
    it { expect(result_of(subject, 'hello.bf')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.bf', 'meow')).to eql("meow") }
  end

  describe 'brainfuck-bfi' do
    it { expect(result_of(subject, 'hello.bfi.bf')).to eql("Hello, world!\n") }
  end

  describe 'brainfuck-moratorium' do
    it { expect(result_of(subject, 'hello.bf')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.bf', "meow")).to eql("meow") }
  end

  describe 'goruby' do
    it { expect(result_of(subject, 'hello.grb')).to eql("Hello, world!\n") }
    it { expect(result_of(subject, 'cat.grb', 'meow')).to eql("meow") }
  end

  describe 'vim' do
    it { expect(result_of(subject, 'hello.vim')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.vim', 'meow')).to eql("meow") }
  end

  describe 'golfscript' do
    it { expect(result_of(subject, 'hello.gs')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.gs', 'meow')).to eql("meow\n") }
  end

  describe 'befunge93' do
    # Demuxing output stream is so hard... So we use `include` instead of `eql`, though it's not right way
    it { expect(result_of(subject, 'hello.b93')).to include("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.b93', 'meow')).to eql("meow") }
  end

  describe 'glass' do
    it { expect(result_of(subject, 'hello.glass')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.glass', 'meow')).to eql("meow\0") }
  end

  describe 'zombie' do
    it { expect(result_of(subject, 'hello.zombie')).to include("Hello, World!\n") }
  end

  describe '05ab1e' do
    it { expect(result_of(subject, 'hello.abe')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.abe', 'meow')).to eql("meow\n") }
  end

  describe '2sable' do
    it { expect(result_of(subject, 'hello.2sable')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.2sable', 'meow')).to eql("meow\n") }
  end

  describe '3var' do
    it { expect(result_of(subject, 'hello.3var')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.3var', 'meow')).to eql("meow\n") }
  end

  describe 'fish' do
    it { expect(result_of(subject, 'hello.fish2d')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.fish2d', 'meow')).to eql("meow") }
  end

  describe 'arcyou' do
    it { expect(result_of(subject, 'hello.arc')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.arc', 'meow')).to eql("meow\n") }
  end

  describe 'emoji' do
    it { expect(result_of(subject, 'hello.emoji')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.emoji', 'meow')).to eql("meow\n") }
  end

  describe 'beam' do
    it { expect(result_of(subject, 'hello.beam')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.beam', 'meow')).to eql("meow\0") }
  end

  describe 'zucchini' do
    it { expect(result_of(subject, 'hello.zucchini')).to eql("Hello, world!\n") }
    it { expect(result_of(subject, 'cat.zucchini', 'meow')).to eql("meow") }
  end

  describe 'wierd' do
    it { expect(result_of(subject, 'hello.wierd')).to eql("Hello, Worl\0d!") }
    it { expect(result_of(subject, 'cat.wierd', 'meow')).to eql("meow") }
  end

  describe 'wordcpu' do
    it { expect(result_of(subject, 'hello.wordcpu')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.wordcpu', 'meow').force_encoding(Encoding::UTF_8)).to eql("meow\xFF") }
  end

  describe 'ffb' do
    it { expect(result_of(subject, 'hello.ffb')).to eql("Hello, World!\n") }
  end

  describe 'fugue' do
    it { expect(result_of(subject, 'hello.fugue.mid')).to eql("Hello World!") }
  end

  describe 'aheui' do
    it { expect(result_of(subject, 'hello.aheui')).to eql("Hello, world!\n") }
  end

  describe 'modanshogi' do
    it { expect(result_of(subject, 'hello.modan')).to eql("Hello, world!\n") }
  end

  describe 'ppap' do
    it { expect(result_of(subject, 'cat.ppap', 'meow')).to include("meow") }
  end

  describe 'starry' do
    it { expect(result_of(subject, 'hello.starry')).to eql("Hello, world!") }
  end

  describe 'whitespace' do
    it { expect(result_of(subject, 'hello.ws')).to eql("Hello World!\n") }
  end

  describe 'aubergine' do
    it { expect(result_of(subject, 'hello.aubergine')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.aubergine', 'meow')).to eql("meow") }
  end

  describe 'ubergenes' do
    it { expect(result_of(subject, 'hello.ubergenes')).to eql("Hello, World!") }
  end

  describe 'path' do
    it { expect(result_of(subject, 'hello.path')).to eql("Hello, world!") }
  end

  describe 'floater' do
    it { expect(result_of(subject, 'hello.floater.png')).to eql("Hello, world!") }
    it { expect(result_of(subject, 'cat.floater.png', 'meow')).to eql("meow") }
  end

  describe 'recurse' do
    it { expect(result_of(subject, 'hello.recurse')).to eql("Hello, world!!") }
  end

  describe 'beatnik' do
    it { expect(result_of(subject, 'hello.beatnik')).to eql("Hello, World!") }
  end

  describe 'blc' do
    it { expect(result_of(subject, 'hello.Blc')).to eql("Hello, World! ") }
    it { expect(result_of(subject, 'cat.Blc', 'meow')).to eql("meow") }
  end

  describe 'z80' do
    it { expect(result_of(subject, 'hello.z8b')).to eql("Hello, world!") }
    it { expect(result_of(subject, 'cat.z8b', 'meow')).to eql("meow") }
  end

  describe 'cardinal' do
    it { expect(result_of(subject, 'hello.cardinal')).to eql("Hello, World!\n") }
  end

  describe 'cjam' do
    it { expect(result_of(subject, 'hello.cjam')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.cjam', 'meow')).to eql("meow") }
  end

  describe 'convex' do
    it { expect(result_of(subject, 'hello.convex')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.convex', 'meow')).to eql("meow") }
  end

  describe 'cubix' do
    it { expect(result_of(subject, 'hello.cubix')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.cubix', 'meow')).to eql("meow") }
  end

  describe 'cy' do
    it { expect(result_of(subject, 'hello.cy')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.cy', 'meow')).to eql("meow\n") }
  end

  describe 'velato' do
    it { expect(result_of(subject, 'hello.velato.mid')).to eql("Hello, World!") }
  end

  describe 'spl' do
    it { expect(result_of(subject, 'hello.spl')).to eql("Hello World!\n") }
  end

  describe 'element' do
    it { expect(result_of(subject, 'hello.element')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.element', 'meow')).to eql("meow") }
  end

  describe 'emojicode' do
    it { expect(result_of(subject, 'hello.emojic')).to eql("Hello, World!\n") }
  end

  describe 'bash-pure' do
    it { expect(result_of(subject, 'hello.bash')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.bash', 'meow')).to eql("meow") }
  end

  describe 'bash-busybox' do
    it { expect(result_of(subject, 'hello.bash')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.bash', 'meow')).to eql("meow") }
  end

  describe 'fernando' do
    it { expect(result_of(subject, 'hello.fernando')).to eql("Hello, world!") }
    it { expect(result_of(subject, 'cat.fernando', 'meow')).to eql("meow") }
  end

  describe 'pure-folders' do
    it { expect(result_of(subject, 'hello.pure-folders.tar')).to eql("Hello, Worl\u0006!") }
  end

  describe 'concise-folders' do
    it { expect(result_of(subject, 'hello.concise-folders.tar')).to eql("Hello, World!") }
  end

  describe 'gs2' do
    it { expect(result_of(subject, 'hello.gs2')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.gs2', 'meow')).to eql("meow\n") }
  end

  describe 'hbcht' do
    it { expect(result_of(subject, 'hello.hbcht')).to eql("Hello, world!\n") }
  end

  describe 'intercal' do
    it { expect(result_of(subject, 'hello.intercal')).to eql("Hello, world!") }
  end

  describe 'japt' do
    it { expect(result_of(subject, 'hello.japt')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.japt', 'meow')).to eql("meow") }
  end

  describe 'jelly' do
    it { expect(result_of(subject, 'hello.jelly')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.jelly', 'meow')).to eql("meow") }
  end

  describe 'jellyfish' do
    it { expect(result_of(subject, 'hello.jellyfish')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.jellyfish', 'meow')).to eql("meow\n") }
  end

  describe 'labyrinth' do
    it { expect(result_of(subject, 'hello.labyrinth')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.labyrinth', 'meow')).to eql("meow") }
  end

  describe 'logicode' do
    it { expect(result_of(subject, 'hello.logicode')).to eql("Hmllo,\x10World\x11\n") } # Boo :(
  end

  describe 'lolcode' do
    it { expect(result_of(subject, 'hello.lolcode')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.lolcode', 'meow')).to eql("meow\n") }
  end

  describe 'matl' do
    it { expect(result_of(subject, 'hello.matl')).to eql("Hello, World!\n") }
  end

  describe 'minimal2d' do
    it { expect(result_of(subject, 'hello.minimal2d')).to eql("Hello, world\n") }
  end

  describe 'minus' do
    it { expect(result_of(subject, 'hello.minus')).to eql("Hello, world!") }
  end

  describe 'sqlite3' do
    it { expect(result_of(subject, 'hello.sqlite3.sql')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.sqlite3.sql', 'meow')).to eql("meow\n") }
  end

  describe 'taxi' do
    it { expect(result_of(subject, 'hello.taxi')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.taxi', 'meow')).to eql("meow") }
  end

  describe 'adjust' do
    it { expect(result_of(subject, 'hello.adjust')).to eql("Hell") }
  end

  describe 'wake' do
    it { expect(result_of(subject, 'hello.wake')).to eql("Hello, world!\n") }
    it { expect(result_of(subject, 'cat.wake', 'meow')).to eql("meow") }
  end

  describe 'irc' do
    it { expect(result_of(subject, 'hello.irc')).to eql("Hello World\n") }
  end

  describe 'braille' do
    it { expect(result_of(subject, 'hello.braille')).to eql("Hello, world!\n") }
  end

  describe 'stop' do
    it { expect(result_of(subject, 'hello.stop')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.stop', 'meow')).to eql("meow") }
  end

  describe 'htms' do
    it { expect(result_of(subject, 'hello.htms')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.htms', 'meow')).to eql("meow\n") }
  end

  describe 'maybelater' do
    it { expect(result_of(subject, 'hello.maybelater')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.maybelater', 'meow')).to eql("meow\n") }
  end

  describe 'suzy' do
    it { expect(result_of(subject, 'hello.suzy')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.suzy', 'meow')).to eql("meow\n") }
  end

  describe 'width' do
    it { expect(result_of(subject, 'hello.width')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.width', 'meow')).to eql("meow\n") }
  end

  describe 'asciidots' do
    it { expect(result_of(subject, 'hello.dots')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.dots', 'meow')).to eql("meow") }
  end

  describe 'cubically' do
    it { expect(result_of(subject, 'hello.cubically')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.cubically', 'meow')).to eql("meow") }
  end

  describe 'sceql' do
    it { expect(result_of(subject, 'hello.sceql')).to eql("Hello, world!\n") }
    it { expect(result_of(subject, 'cat.sceql', 'meow')).to eql("meow") }
  end

  describe 'typhon' do
    it { expect(result_of(subject, 'hello.typhon')).to eql("Hello, World") }
    it { expect(result_of(subject, 'cat.typhon', 'meow')).to eql("meow") }
  end

  describe 'alice' do
    it { expect(result_of(subject, 'hello.alice')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.alice', 'meow')).to eql("meow\n") }
  end

  describe 'apl' do
    it { expect(result_of(subject, 'hello.apl')).to include("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.apl', 'meow')).to eql("meow\n\n") }
  end

  describe 'function2d' do
    it { expect(result_of(subject, 'hello.function')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.function', 'meow')).to eql("meow") }
  end

  describe 'lazyk' do
    it { expect(result_of(subject, 'hello.lazyk')).to eql("Hello, world!\n") }
    it { expect(result_of(subject, 'cat.lazyk', 'meow')).to eql('meow') }
  end

  describe 'doubleplusungood' do
    it { expect(result_of(subject, 'hello.doubleplusungood')).to eql('Hello, Wo') }
    it { expect(result_of(subject, 'cat.doubleplusungood', 'meow')).to eql("meow\n") }
  end

  describe 'rprogn' do
    it { expect(result_of(subject, 'hello.rprogn')).to eql('Hello, World!') }
    it { expect(result_of(subject, 'cat.rprogn', 'meow')).to eql('meow') }
  end

  describe 'whenever' do
    it { expect(result_of(subject, 'hello.whenever')).to eql("Hello, World!\n") }
  end

  describe 'reversed-c' do
    it { expect(result_of(subject, 'hello.rev-c')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.rev-c', 'meow')).to eql("meow") }
  end

  describe 'iwashi' do
    it { expect(result_of(subject, 'hello.iwashi')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.iwashi', 'meow')).to eql('meow') }
  end

  describe 'standback' do
    it { expect(result_of(subject, 'hello.standback')).to eql('Hello, world!') }
    it { expect(result_of(subject, 'cat.standback', 'meow')).to eql('meow') }
  end

  describe 'multi-reader' do
    it { expect(result_of(subject, 'hello.kuso')).to eql('H') }
    it { expect(result_of(subject, 'cat.kuso', 'meow')).to eql('meow') }
  end

  describe 'copos-rb' do
    it { expect(result_of(subject, 'hello.copos-rb')).to eql("Hello, world!\n") }
    it { expect(result_of(subject, 'cat.copos-rb', 'meow')).to eql('meow') }
  end

  describe 'golfish' do
    it { expect(result_of(subject, 'hello.golfish')).to eql("Hello, world!\n") }
    it { expect(result_of(subject, 'cat.golfish', 'meow')).to eql('meow') }
  end

  describe 'moo' do
    it { expect(result_of(subject, 'hello.moo')).to eql("Hello, world!") }
    it { expect(result_of(subject, 'cat.moo', 'meow')).to eql('meow') }
  end

  describe 'codemania' do
    it { expect(result_of(subject, 'hello.codemania')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.codemania', 'meow')).to eql("meow") }
  end

  describe 'bots' do
    it { expect(result_of(subject, 'hello.bots')).to eql('Hello, world!') }
    it { expect(result_of(subject, 'cat.bots', 'meow')).to eql('meow') }
  end

  describe 'floating' do
    it { expect(result_of(subject, 'hello.floating')).to eql('Hello, world!') }
    it { expect(result_of(subject, 'cat.floating', 'meow')).to eql('meow') }
  end

  describe 'picfunge' do
    it { expect(result_of(subject, 'hello.picfunge.png')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.picfunge.png', 'meow')).to eql('meow') }
  end

  describe 'hanoi_stack' do
    it { expect(result_of(subject, 'hello.hanoi')).to eql("Hello World!\n") }
    it { expect(result_of(subject, 'cat.hanoi', 'meow')).to eql('meow') }
  end

  describe 'exchangeif' do
    it { expect(result_of(subject, 'hello.exif')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.exif', 'meow')).to eql('meow') }
  end

  describe 'unicue' do
    it { expect(result_of(subject, 'hello.unicue')).to eql("Hello, World") }
  end

  describe 'qlb' do
    it { expect(result_of(subject, 'hello.qlb')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.qlb', 'meow')).to eql("meow\n") }
  end

  describe 'calc' do
    it { expect(result_of(subject, 'hello.calc.csv')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.calc.csv', 'meow')).to eql("meow") }
  end

  describe 'xslt' do
    it { expect(result_of(subject, 'hello.xsl')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.xsl', 'meow')).to eql("meow") }
  end

  describe 'awk' do
    it { expect(result_of(subject, 'hello.awk')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.awk', 'meow')).to eql("meow\n") }
  end

  describe 'fortran' do
    it { expect(result_of(subject, 'hello.f08')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.f08', 'meow')).to eql("meow\n") }
  end

  describe 'coq' do
    it { expect(result_of(subject, 'hello.coq.v')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.coq.v', 'meow')).to eql("meow\n") }
  end

  describe 'perl6' do
    it { expect(result_of(subject, 'hello.p6')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.p6', 'meow')).to eql("meow\n") }
  end

  describe 'ring' do
    it { expect(result_of(subject, 'hello.ring')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.ring', 'meow')).to eql("meow") }
  end

  describe 'ballerina' do
    it { expect(result_of(subject, 'hello.bal')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.bal', 'meow')).to eql("meow\n") }
  end

  describe 'sed' do
    it { expect(result_of(subject, 'hello.sed')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.sed', 'meow')).to eql("meow") }
  end

  describe 'produire' do
    it { expect(result_of(subject, 'hello.rdr')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.rdr', 'meow')).to eql("meow\n\n") }
  end

  describe 'ezhil' do
    it { expect(result_of(subject, 'hello.ezhil.n')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.ezhil.n', 'meow')).to eql("meow\n") }
  end

  describe 'snobol' do
    it { expect(result_of(subject, 'hello.sno')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.sno', 'meow')).to eql("meow\n") }
  end

  describe 'snusp' do
    it { expect(result_of(subject, 'hello.snusp')).to eql("Hello World!\n") }
    it { expect(result_of(subject, 'cat.snusp', 'meow')).to eql("meow") }
  end

  describe 'clisp-sbcl' do
    it { expect(result_of(subject, 'hello.cl')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.cl', 'meow')).to eql("meow") }
  end

  describe 'cobol' do
    it { expect(result_of(subject, 'hello.cbl')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.cbl', 'meow')).to eql("meow\n") }
  end

  describe 'autovim' do
    it { expect(result_of(subject, 'hello.autovim')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.autovim', 'meow')).to eql("meow\n") }
  end

  describe 'pxem' do
    it { expect(result_of(subject, 'hello.pxem')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.pxem', 'meow')).to eql("meow") }
  end

  describe('riscv', skip: 'cat does not work i have no idea') do
    it { expect(result_of(subject, 'hello.riscv.elf')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.riscv.elf', 'meow')).to eql("meow") }
  end

  describe 'cpp-compile-time-clang' do
    it { expect(result_of(subject, 'hello.compile-time.cpp')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.compile-time.cpp', 'meow')).to eql("meow") }
  end

  describe 'm4' do
    it { expect(result_of(subject, 'hello.m4')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.m4', 'meow')).to eql("meow") }
  end

  describe 'nuts' do
    it { expect(result_of(subject, 'hello.nuts')).to eql("Hello, world!") }
    it { expect(result_of(subject, 'cat.nuts', 'meow')).to eql("meow") }
  end

  describe 'canvas' do
    it { expect(result_of(subject, 'hello.canvas')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.canvas', 'meow')).to eql("meow") }
  end

  describe 'hypertorus' do
    it { expect(result_of(subject, 'hello.hyp')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.hyp', 'meow')).to eql("meow") }
  end

  describe 'gaia' do
    it { expect(result_of(subject, 'hello.gaia')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.gaia', 'meow')).to eql("meow\n") }
  end

  describe 'abc' do
    it { expect(result_of(subject, 'hello.abc')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.abc', 'meow')).to eql("meow") }
  end

  describe 'wysiscript' do
    it { expect(result_of(subject, 'hello.wysi')).to eql("Hello World!") }
    it { expect(result_of(subject, 'cat.wysi', 'meow')).to eql("meow\n") }
  end

  describe('squared-cool', skip: 'I dont have time to fix it.') do
    it { expect(result_of(subject, 'hello.squared-cool')).to eql("👋🗺️\n️") }
    it { expect(result_of(subject, 'cat.squared-cool', '🐈🐾')).to eql("🐈🐾") }
  end

  describe 'arithmetic' do
    it { expect(result_of(subject, 'hello.arithmetic')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.arithmetic', 'meow')).to eql("meow") }
  end

  describe 'tetris' do
    it { expect(result_of(subject, 'hello.tetris')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.tetris', 'meow')).to eql("meow") }
  end

  describe 'racket' do
    it { expect(result_of(subject, 'hello.rkt')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.rkt', 'meow')).to eql("meow") }
  end

  describe 'husk' do
    it { expect(result_of(subject, 'hello.husk')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.husk', 'meow')).to eql("meow") }
  end

  describe 'fetlang' do
    it { expect(result_of(subject, 'hello.fet')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.fet', "meow\n")).to eql("meow\n") }
  end

  describe 'triangularity' do
    it { expect(result_of(subject, 'hello.triangularity')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.triangularity', "meow")).to eql("meow\n") }
  end

  describe 'alphabeta' do
    it { expect(result_of(subject, 'hello.alphabeta')).to eql("Hello World!") }
    it { expect(result_of(subject, 'cat.alphabeta', "meow\n")).to eql("meow\n\n") }
  end

  describe 'tcl' do
    it { expect(result_of(subject, 'hello.tcl')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.tcl', "meow")).to eql("meow\n") }
  end

  describe 'backhand' do
    it { expect(result_of(subject, 'hello.backhand')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.backhand', "meow")).to eql("meow") }
  end

  describe 'emacs', skip: 'なぜか動かない' do
    it { expect(result_of(subject, 'hello.emacs')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.emacs', "meow")).to eql("meow") }
  end

  describe 'tex' do
    it { expect(result_of(subject, 'hello.tex')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.tex', "meow")).to eql("meow\n") }
  end

  describe 'bubble-sort' do
    it { expect(result_of(subject, 'hello.bsl')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.bsl', "meow")).to eql("meow") }
  end

  describe 'gnuplot' do
    it { expect(result_of(subject, 'hello.gp')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.gp', "meow")).to eql("meow\n") }
  end

  describe 'golang' do
    it { expect(result_of(subject, 'hello.go')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.go', "meow")).to eql("meow\n") }
  end

  describe 'egison' do
    it { expect(result_of(subject, 'hello.segi')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.segi', "meow")).to eql("meow\n") }
  end

  describe 'classic-music-theory' do
    it { expect(result_of(subject, 'hello.cmsfp')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.cmsfp', "meow")).to eql("meow") }
  end

  describe 'braintwist' do
    it { expect(result_of(subject, 'hello.bt')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.bt', "meow")).to eql("meow") }
  end

  describe 'mines' do
    it { expect(result_of(subject, 'hello.mines')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.mines', "meow")).to eql("meow") }
  end

  describe 'wenyan' do
    it { expect(result_of(subject, 'hello.wy')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.wy', "meow")).to eql("meow") }
  end

  describe 'cyclicbrainfuck' do
    it { expect(result_of(subject, 'hello.cyclicbf')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.cyclicbf', "meow")).to eql("meow") }
  end

  describe 'olang' do
    it { expect(result_of(subject, 'hello.ogc')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.ogc', "meow")).to eql("meow") }
  end

  describe 'v-vim' do
    it { expect(result_of(subject, 'hello.v-vim')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.v-vim', "meow")).to eql("meow") }
  end

  describe 'pyramid-scheme' do
    it { expect(result_of(subject, 'hello.pyramid-scheme')).to eql("Hello\n") }
    it { expect(result_of(subject, 'cat.pyramid-scheme', "meow")).to eql("meow\n") }
  end

  describe 'transceternal' do
    it { expect(result_of(subject, 'hello.transceternal')).to eql("Hello, World!") }
    it { expect(result_of(subject, 'cat.transceternal', "meow")).to eql("meow") }
  end

  describe 'compile-time-typescript' do
    it { expect(result_of(subject, 'hello.compile-time.ts')).to eql("Hello, World!\n") }
    it { expect(result_of(subject, 'cat.compile-time.ts', "meow")).to eql("meow") }
  end
end
