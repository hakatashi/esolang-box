require "docker"

# https://github.com/swipely/docker-api/issues/202
Excon.defaults[:ssl_verify_peer] = false
