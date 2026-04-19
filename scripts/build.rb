require 'bundler/setup'
require 'yaml'
require 'set'
require_relative 'utils'

# HCL generation helpers
def hcl_str(s)
  "\"#{s}\""
end

def hcl_list(arr)
  "[#{arr.map { |s| hcl_str(s) }.join(', ')}]"
end

# HCL target names only allow [a-zA-Z0-9_-]; replace dots with underscores
def hcl_target_name(id)
  id.tr('.', '_')
end

VERSION = '2.5.0'

languages = load_languages

sorted_ids = topo_sort(languages)

depth_cache = {}

$langs = []
$outdated_langs = {}
$bake_targets = []

puts "## List of boxes\n\n"

sorted_ids.each do |id|
  data = languages[id]
  parent = data['parent']
  disabled = data['disabled'] || false

  $bake_targets << { id: id, parent: parent, disabled: disabled }

  if disabled
    disabled_after = data['disabled_after']
    unless disabled_after.nil?
      $outdated_langs[disabled_after] ||= []
      $outdated_langs[disabled_after] << {
        'id' => id,
        'name' => data['name'],
        'link' => data['link'],
      }
    end
  else
    $langs << id

    depth = depth_of(id, languages, depth_cache)
    name = data['name']
    link = data['link']
    indent = ' ' * (4 * depth)

    if name.nil? || link.nil?
      puts "#{indent}* [`esolang/#{id}`](https://hub.docker.com/r/esolang/#{id}/)"
    else
      puts "#{indent}* [`esolang/#{id}`](https://hub.docker.com/r/esolang/#{id}/): [#{name}](#{link})"
    end
  end
end

puts "\n## Obsolete languages\n\nThese languages are no longer maintained, and their images may be outdated since their last update.\n"

$outdated_langs.keys.sort.each do |version|
  puts "\n### esolang-box #{version}\n\n"
  $outdated_langs[version].each do |lang|
    if lang['name'].nil? || lang['link'].nil?
      puts "* [`esolang/#{lang['id']}`](https://hub.docker.com/r/esolang/#{lang['id']}/)"
    else
      puts "* [`esolang/#{lang['id']}`](https://hub.docker.com/r/esolang/#{lang['id']}/): [#{lang['name']}](#{lang['link']})"
    end
  end
end

# Generate docker-bake.hcl
lines = []
lines << '# This file is auto-generated from boxes/*/box.yaml. Please don\'t edit directly.'
lines << ''
lines << 'group "default" {'
lines << "  targets = #{hcl_list($langs.map { |id| hcl_target_name(id) })}"
lines << '}'

$bake_targets.each do |t|
  lines << ''
  lines << "target #{hcl_str(hcl_target_name(t[:id]))} {"
  lines << "  context = #{hcl_str("boxes/#{t[:id]}")}"
  if t[:parent]
    lines << '  contexts = {'
    lines << "    #{hcl_str("esolang/#{t[:parent]}")} = #{hcl_str("target:#{hcl_target_name(t[:parent])}")}"
    lines << '  }'
  end
  lines << "  tags = #{hcl_list(["esolang/#{t[:id]}:latest", "esolang/#{t[:id]}:#{VERSION}"])}"
  lines << '}'
end

File.write(
  File.join(__dir__, '..', 'docker-bake.hcl'),
  lines.join("\n") + "\n"
)

warn 'Generated docker-bake.hcl'
