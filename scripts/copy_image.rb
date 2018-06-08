#!/usr/bin/env ruby

require 'json'
require_relative 'model'
require 'fileutils'

if ARGV.count < 2
  puts "Aruguments error!"
  puts "ruby copy_image.rb <notebook> <filename>"
  exit
end

notebook, image_path = ARGV

base_name = File.basename(image_path)

target_path = File.join(project_base_folder, "notebooks", notebook, "images", base_name)

puts "Copy image #{base_name} form #{image_path}"
puts "To #{target_path}"

FileUtils.mv(image_path, target_path)

puts "Done"