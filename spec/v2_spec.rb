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
        'Binds' => ["#{File.expand_path('assets').gsub(/^C:/, '/c').gsub(/^\/mnt/, '')}:/assets:ro"],
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
      container.tap(&:start).attach(stdin: StringIO.new(stdin))[0][0]
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
end
