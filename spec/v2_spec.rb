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

  describe 'brainfuck-bfi' do
    it { expect(result_of(subject, '/assets/hello.bfi.bf')).to eql("Hello, world!\n") }
  end
end
