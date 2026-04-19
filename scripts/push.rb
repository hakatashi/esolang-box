require 'httpclient'
require 'yaml'
require 'json'
require 'erb'
require_relative 'utils'

VERSION = '2.5.0'

$erb = ERB.new(File.read(File.join(__dir__, 'box_readme.md.erb')))

languages = load_languages

# Count active languages that have both name and link
$language_count = languages.count do |_id, data|
  !data['disabled'] && !data['name'].nil? && !data['link'].nil?
end

languages.each do |slug, data|
  next if data['disabled']
  next if data['name'].nil? || data['link'].nil?

  name = data['name']
  link = data['link']
  disasm = data['disasm'] == true

  hello_test = (data['tests'] || {})['hello']
  hello_file = hello_test&.fetch('file', nil)
  hello_out = hello_test&.fetch('expected', nil)&.rstrip

  hello_content = nil
  if hello_file
    asset_path = File.join(__dir__, 'boxes', slug, 'assets', hello_file)
    if File.exist?(asset_path)
      content = File.read(asset_path, encoding: 'utf-8')
      if content.valid_encoding? && content.chars.size <= 250
        hello_content = content
      end
    end
  end

  language_count = $language_count
  readme = $erb.result(binding)

  client = HTTPClient.new
  client.ssl_config.set_trust_ca('/etc/ssl/certs/ca-certificates.crt')
  client.debug_dev = $stderr
  # To get token:
  # curl -s -H "Content-Type: application/json" -X POST -d '{"username": "'${UNAME}'", "password": "'${UPASS}'"}' https://hub.docker.com/v2/users/login/
  res = client.patch("https://hub.docker.com/v2/repositories/esolang/#{slug}/",
    header: {
      Authorization: "JWT #{ENV['TOKEN']}",
      'Content-Type' => 'application/json',
    },
    body: JSON.generate({
      description: "Easily execute #{name} programming language",
      full_description: readme,
    }),
  )
end
