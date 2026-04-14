require "docker"

# On Windows, docker-api/excon does not support named pipes (npipe: scheme).
# Use TCP instead: enable "Expose daemon on tcp://localhost:2375 without TLS"
# in Docker Desktop Settings > General.
if Gem.win_platform? || RUBY_PLATFORM =~ /cygwin|mswin|mingw/
  Docker.url = ENV.fetch('DOCKER_HOST', 'tcp://127.0.0.1:2375')
end

# https://github.com/swipely/docker-api/issues/202
Excon.defaults[:ssl_verify_peer] = false
