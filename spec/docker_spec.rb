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

  it 'installs gcc' do
    expect(package('gcc')).to be_installed
  end

  it 'installs ruby' do
    expect(command('ruby -v').stdout).to match(/ruby 2.4.0/)
    expect(command('ruby assets/hello.rb').stdout).to eql("Hello, World!\n")
    expect(command('ruby2.4 assets/hello.rb').stdout).to eql("Hello, World!\n")
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
    pending('Stack Cats program times out when executed from api. No idea why...')

    Timeout::timeout(1) do
      expect(command('stackcats assets/hello.stackcats').stdout).to eql("Hello, World!")
    end
  end

  it 'installs trumpscript' do
    expect(command('trumpscript --shut-up assets/hello.trumpscript').stdout).to eql("hello, world!\n")
  end

end
