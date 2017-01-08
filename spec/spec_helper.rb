require "docker"
require "serverspec"

set :backend, :docker
set :docker_url, ENV["DOCKER_HOST"]

# https://github.com/swipely/docker-api/issues/202
Excon.defaults[:ssl_verify_peer] = false
