require 'yaml'

$boxes = YAML::load_file(File.join(__dir__, 'boxes.yml'))

$dobi = {
  'meta' => {
    'project' => 'esolang-box',
    'default' => 'all',
  },
  'alias=all' => nil,
}

$langs = []

def iterate(lang, parent = nil)
  lang.each do |key, value|
    unless key.start_with? '_'
      $dobi["image=#{key}"] = {
        'image' => "esolang/#{key}",
        'context' => "boxes/#{key}",
        'tags' => ['latest'],
        'depends' => if parent.nil? then [] else [parent] end,
      }
      $langs << key
      iterate value, key
    end
  end
end

iterate $boxes

$dobi['alias=all'] = {
  'tasks' => $langs,
}

File.write File.join(__dir__, 'dobi.yaml'), $dobi.to_yaml

print 'Generated dobi.yaml'
