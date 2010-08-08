#!/usr/bin/env ruby

require 'rubygems'
require 'commander/import'

# Usage: total-hours.rb file_containing_hours
# The file format should be as follows:
# 7/30/10, 7:50 - 8:34, Setting up project

program :name, 'Total Hours'
program :version, '0.0.1'
program :description, 'Works with my hours file format'

command :total do |c|
  c.when_called do |args, options|
    total_hours = 0.0

    File.open(args[0], 'r') do |f|
      f.each do |line|
        s_hours, s_minutes = line.split[1].split(':').map {|s| s.to_i }
        e_hours, e_minutes = line.split[3].split(':').map {|s| s.to_i }

        hours = e_hours - s_hours
        minutes = e_minutes - s_minutes

        total_hours += hours + (minutes.to_f / 60)
      end
    end

    puts "You worked: #{total_hours}"
  end
end
