#!/usr/bin/env ruby

require 'fileutils'

case ENV["COMP_LINE"]
when /\Arake\s+(.*)/
  COMMAND = 'rake'
  filedependencies = ['rakefile', 'Rakefile', 'rakefile.rb', 'Rakefile.rb']
when /\Acap\s+(.*)/
  COMMAND = 'cap'
  filedependencies = ['config/deploy.rb']
else
  exit 0
end

# We exit, if the FILEDEPENDENCIES aren't met:
exit 0 unless filedependencies.any? { |file_deps| File.file?(File.join(Dir.pwd, file_deps)) }

task_to_complete = $1

# We define cache-directory, based on the name of the command (cap or rake).
# And make the cache-directory, if it doesn't exist.
#
def cache_dir
  cache_dir = File.join( ENV['HOME'], %Q{.#{COMMAND}_completion} )
  FileUtils.mkdir_p cache_dir
end

# We define the cache-file based on the path of the current directory:
#
def cache_file
  File.join( cache_dir, Dir.pwd.hash.to_s )
end

# If a recent cache_file exists, we read it into tasks.
# Otherwise we generate the tasks and write them to a new cache_file.
# We return the tasks, one in a line.
#
def all_tasks
  if File.exists?(cache_file) && (Time.now - File.ctime(cache_file) < 60 * 60 * 24)
    tasks = File.read(cache_file)
  else
    tasks = `#{COMMAND} -T | grep "^#{COMMAND}" | cut -d " " -f 2`
    File.open(cache_file, 'w') { |f| f.puts tasks }
  end
  
  return tasks.split("\n").map { |t| t.strip }
end

# Select matching tasks:
tasks = all_tasks.select { |t| t.match /\A#{task_to_complete}/ }

# Handle namespaces (remove anything before the last colon):
up_to_colon = task_to_complete[/\A([-\w:]+:)/] || ''
tasks.map! { |t| t.gsub(up_to_colon,'') }

puts tasks
exit 0
