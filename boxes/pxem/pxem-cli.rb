require 'rpxem'

if ARGV.size != 1
  STDERR.print "Usage: ruby #{$0} [input file]"
  exit 1
end

content = File.read(ARGV[0])
head, *tail = content.lines

RPxem.run(head, tail.join('\n'))
