require 'yaml'
require 'json'
require 'json-schema'

def load_languages
  JSON::Validator.use_multi_json = false

  # Load and compile JSON schema
  schema_path = File.join(__dir__, '..', 'schemas', 'box.yaml.schema.json')
  schema = JSON.parse(File.read(schema_path))

  # Load all language.yaml files
  languages = {}
  Dir.glob(File.join(__dir__, '..', 'boxes', '*', 'box.yaml')).sort.each do |path|
    lang_id = File.basename(File.dirname(path))
    raw = File.read(path, encoding: 'utf-8')
    data = YAML.safe_load(raw) || {}

    errors = JSON::Validator.fully_validate(schema, data)
    unless errors.empty?
      warn "Validation errors in #{path}:"
      errors.each { |e| warn "  #{e}" }
      exit 1
    end

    assets_dir = File.join(File.dirname(path), 'assets')
    if Dir.exist?(assets_dir)
      credits = data['credits'] || {}
      asset_files = Dir.children(assets_dir).sort
      missing = asset_files.reject { |f| credits.key?(f) }
      unless missing.empty?
        warn "Missing credits in #{path} for: #{missing.join(', ')}"
        exit 1
      end
    end

    languages[lang_id] = data
  end

  languages
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

def parents_of(id, languages)
  result = []
  current = id
  while (parent = languages[current]&.fetch('parent', nil))
    result << parent
    current = parent
  end
  result.reverse
end