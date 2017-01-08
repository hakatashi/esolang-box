require "spec_helper"

describe 'Dockerfile' do

  before(:all) do
    image = Docker::Image.build_from_dir('.')
    set :os, family: :ubuntu
    set :docker_image, image.id
  end

  describe package('gcc') do
    it { should be_installed }
  end

  describe command('ruby -v') do
    its(:stdout) { should match(/ruby 2.4.0/) }
  end

end
