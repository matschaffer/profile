#!/usr/bin/env ruby

# Complete rake tasks script for bash
# Save it somewhere and then add
# complete -C path/to/script -o default rake
# to your ~/.bashrc
# Xavier Shay (http://rhnh.net), combining work from
#   Francis Hwang ( http://fhwang.net/ ) - http://fhwang.net/rb/rake-complete.rb
#   Nicholas Seckar <nseckar@gmail.com>  - http://www.webtypes.com/2006/03/31/rake-completion-script-that-handles-namespaces
#   Saimon Moore <saimon@webtypes.com>

require 'fileutils'

RAKEFILES = ['rakefile', 'Rakefile', 'rakefile.rb', 'Rakefile.rb']
exit 0 unless RAKEFILES.any? { |rf| File.file?(File.join(Dir.pwd, rf)) }
exit 0 unless /^rake\b/ =~ ENV["COMP_LINE"]

after_match = $'
task_match = (after_match.empty? || after_match =~ /\s$/) ? nil : after_match.split.last
cache_dir = File.join( ENV['HOME'], '.rake', 'tc_cache' )
FileUtils.mkdir_p cache_dir
rakefile = RAKEFILES.detect { |rf| File.file?(File.join(Dir.pwd, rf)) }
rakefile_path = File.join( Dir.pwd, rakefile )
cache_file = File.join( cache_dir, rakefile_path.gsub( %r{/}, '_' ) )
if File.exist?( cache_file ) &&
   File.mtime( cache_file ) >= (Dir['lib/tasks/*.rake'] << rakefile).collect {|x| File.mtime(x) }.max
  task_lines = File.read( cache_file )
else
  task_lines = `rake --silent --tasks`
  File.open( cache_file, 'w' ) do |f| f << task_lines; end
end
tasks = task_lines.split("\n")[1..-1].collect {|line| line.split[1]}
tasks = tasks.select {|t| /^#{Regexp.escape task_match}/ =~ t} if task_match

# handle namespaces
if task_match =~ /^([-\w:]+:)/
  upto_last_colon = $1
  after_match = $'
  tasks = tasks.collect { |t| (t =~ /^#{Regexp.escape upto_last_colon}([-\w:]+)$/) ? "#{$1}" : t }
end

puts tasks
exit 0
