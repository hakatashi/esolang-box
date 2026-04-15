require 'bundler/setup'
require 'yaml'
require 'json'
require 'json-schema'
require 'set'

JSON::Validator.use_multi_json = false

VERSION = '2.4.0'

# Load and compile JSON Schema
SCHEMA_PATH = File.join(__dir__, 'schemas', 'language.schema.json')
SCHEMA = JSON.parse(File.read(SCHEMA_PATH))

# Load all language.yaml files
languages = {}
Dir.glob(File.join(__dir__, 'boxes', '*', 'box.yaml')).sort.each do |path|
  lang_id = File.basename(File.dirname(path))
  raw = File.read(path, encoding: 'utf-8')
  data = YAML.safe_load(raw) || {}

  errors = JSON::Validator.fully_validate(SCHEMA, data)
  unless errors.empty?
    warn "Validation errors in #{path}:"
    errors.each { |e| warn "  #{e}" }
    exit 1
  end

  languages[lang_id] = data
end

# Pre-order DFS: each box is followed immediately by all its descendants.
# Siblings are sorted alphabetically within each parent group.
def topo_sort(languages)
  children = Hash.new { |h, k| h[k] = [] }
  roots = []

  languages.each_key do |id|
    parent = languages[id]['parent']
    if parent && languages.key?(parent)
      children[parent] << id
    else
      roots << id
    end
  end

  children.each_value(&:sort!)
  roots.sort!

  sorted = []
  visit = lambda do |id|
    sorted << id
    children[id].each { |child| visit.call(child) }
  end

  roots.each { |root| visit.call(root) }
  sorted
end

sorted_ids = topo_sort(languages)

# Calculate hierarchy depth for README indentation
def depth_of(id, languages, cache = {})
  return cache[id] if cache.key?(id)
  parent = languages[id]&.fetch('parent', nil)
  cache[id] = if parent && languages.key?(parent)
    1 + depth_of(parent, languages, cache)
  else
    0
  end
end

depth_cache = {}

$dobi = {
  'meta' => {
    'project' => 'esolang-box',
    'default' => 'all',
  },
  'alias=all' => nil,
  'alias=tag-all' => nil,
}

$langs = []
$tag_langs = []
$outdated_langs = {}

puts "## List of boxes\n\n"

sorted_ids.each do |id|
  data = languages[id]
  parent = data['parent']
  disabled = data['disabled'] || false

  $dobi["image=#{id}"] = {
    'image' => "esolang/#{id}",
    'context' => "boxes/#{id}",
    'tags' => ['latest', VERSION],
    'depends' => parent ? [parent] : [],
  }

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
    $tag_langs << "#{id}:tag"

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

$dobi['alias=all'] = {
  'tasks' => $langs,
}

$dobi['alias=tag-all'] = {
  'tasks' => $tag_langs,
}

File.write(
  File.join(__dir__, 'dobi.yaml'),
  "# This file is auto-generated from boxes/*/box.yaml. Please don't edit directly.\n#{$dobi.to_yaml}"
)

warn 'Generated dobi.yaml'
