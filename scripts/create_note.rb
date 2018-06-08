#!/usr/bin/env ruby

require 'json'
require_relative 'model'

def note_path(notebook, note)
  note = "#{note}.md" unless note.end_with?(".md")
  File.join(project_base_folder, "notebooks", notebook, note)
end

def create_note(notebook, note)
  lines = []
  lines << "<!-- "
  lines << "title: <title>"
  lines << "from: <from>"
  lines << "create: #{today}"
  lines << "tags: <tag,tag>"
  lines << "-->"
  lines << ""
  lines << "## #{note}"
  path = note_path(notebook, note)
  File.open(path, 'w') {|f| f.write lines.join("\n")}
end


if ARGV.count < 2
  puts "Aruguments error!"
  puts "ruby create_note.rb <notebook> <filename>"
  exit
end

notebook, filename = ARGV

unless get_local_notebooks.include? notebook
  puts "Aruguments error!"
  puts "Notebook '#{notebook}' does not exist"
  exit
end

puts "Will Create file '#{filename}' into '#{notebook}'"
create_note(notebook, filename)
puts "Done"



