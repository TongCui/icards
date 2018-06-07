#!/usr/bin/env ruby

require 'json'
require_relative 'model'
require_relative 'common'

def readme_file
  File.join(project_base_folder, "README.md")
end

def notebook_prefix
  "### "
end

def date_prefix
  "##### "
end

def update_readme_headers(lines)
  lines << "iCards is a personal notbooks App"
  lines << ""
  lines << "## Contents"
  lines << ""
end

def update_readme
  lines = []
  update_readme_headers lines
  
  get_local_notebooks_models.each do |notebook|
    lines << ""
    lines << "#{notebook_prefix} #{notebook.name} (#{notebook.notes.size} Notes)"
    lines << ""
    dates_map = Hash.new { |hash, key| hash[key] = [] }
    notebook.notes.each { |note| dates_map[note.create] << note }
    
    dates_map.sort.each do |date, notes|
      lines << "#{date_prefix} #{date}"
      notes.sort{|lhs, rhs|lhs.title <=> rhs.title}.each do |note|
        lines << "- [#{note.title}](/notebooks/#{notebook.name}/#{note.file_name})"
      end
    end
  end

  File.open(readme_file, "w") {|f| f.write lines.join("\n")}
end

# generate models and update json files
update_readme




