require 'json'
require_relative 'utils'

GITHUB_OUTPUT = ENV['GITHUB_OUTPUT']
if GITHUB_OUTPUT.nil? || GITHUB_OUTPUT.empty?
  warn "GITHUB_OUTPUT environment variable is not set. Exiting."
  exit 1
end

changed_files = ENV['ALL_CHANGED_FILES'] ? ENV['ALL_CHANGED_FILES'].split : `git diff --name-only HEAD~1`.split("\n")

puts "Changed files: #{changed_files.join(', ')}"

changed_boxes = Set.new

changed_files.each do |file|
  parts = file.split(File::SEPARATOR)
  if parts.length >= 2 && parts[0] == 'boxes'
    changed_boxes << parts[1]
  end
end

puts "Changed boxes: #{changed_boxes.to_a.join(', ')}"

languages = load_languages

puts "Loaded #{languages.size} languages from box.yaml files"

affected_languages = languages.select do |id, data|
  ([id] + parents_of(id, languages)).any? do |lang_id|
    changed_boxes.include?(lang_id)
  end
end

puts "Affected languages: #{affected_languages.keys.join(', ')}"

affected_languages.each do |id, data|
  unless /^[a-z0-9._-]+$/.match?(id)
    warn "Invalid language ID '#{id}' - must only contain lowercase letters, digits, periods, underscores, and hyphens"
    exit 1
  end
end

# GitHub Actions matrix has a limit of 256 jobs, so we need to limit the number of affected languages. If there are more than 256, we'll just take the first 256.
if affected_languages.size > 256
  print "::warning::More than 256 affected languages (#{affected_languages.size}). Only the first 256 will be included in the matrix."
  affected_languages = affected_languages.to_a.first(256).to_h
end

File.open(GITHUB_OUTPUT, 'a') do |f|
  f.puts "affected_languages=#{JSON.generate(affected_languages.keys)}"
end

puts "Affected languages written to GITHUB_OUTPUT"
