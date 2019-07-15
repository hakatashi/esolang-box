require 'httpclient'
require 'yaml'
require 'json'
require 'erb'

VERSION = '2.2.0'

$erb = ERB.new(File.read(File.join(__dir__, 'box_readme.md.erb')))
$boxes = YAML::load_file(File.join(__dir__, 'boxes.yml'))

$hello_files = {}
$hello_outs = {}
$hello_contents = {}
spec_file = File.read(File.join(__dir__, 'spec', 'boxes_spec.rb'))
current_lang = nil
spec_file.lines do |line|
  if match = line.match(/describe\s+'(.+?)'/i)
    current_lang, = match.captures
  end
  if match = line.match(/'(hello\..+?)'/i)
    hello_file, = match.captures
    $hello_files[current_lang] = hello_file
    hello_content = File.read(File.join(__dir__, 'spec', 'assets', hello_file))
    if hello_content.valid_encoding? && hello_content.chars.size <= 250
      $hello_contents[current_lang] = hello_content
    end
  end
  if match = line.match(/hello.+eql\((['"].+?['"])\)/i)
    hello_out, = match.captures
    $hello_outs[current_lang] = YAML.load(%Q(---\n#{hello_out}\n)).rstrip
  end
end

def do_count(lang, parent = nil)
  count = 0
  lang.each do |key, value|
    unless key.start_with? '_'
      unless value['_disabled'] || value['_name'].nil? || value['_link'].nil?
        count += 1
      end
      count += do_count value, key
    end
  end
  count
end

$language_count = do_count $boxes

def iterate(lang, parent = nil)
  lang.each do |key, value|
    unless key.start_with? '_'
      unless value['_disabled'] || value['_name'].nil? || value['_link'].nil?
        name = value['_name']
        link = value['_link']
        slug = key
        hello_file = $hello_files[key]
        hello_content = $hello_contents[key]
        hello_out = $hello_outs[key]
        disasm = value['_disasm'] == true
        language_count = $language_count
        readme = $erb.result(binding)

        client = HTTPClient.new
        client.debug_dev = $stderr
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

      iterate value, key
    end
  end
end

iterate $boxes
