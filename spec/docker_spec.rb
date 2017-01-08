require "spec_helper"

describe 'Dockerfile' do

  before(:all) do
    image = Docker::Image.build_from_dir('.')
    set :os, family: :ubuntu
    set :docker_image, image.id
  end

  it 'installs gcc' do
    expect(package('gcc')).to be_installed
  end

  it 'installs ruby' do
    expect(command('ruby -v').stdout).to match(/ruby 2.4.0/)
  end

  it 'installs hexagony' do
    expect(command('hexagony ~/assets/hello.hxg').stdout).to eql('Hello, World!')
  end

end
