#!/usr/bin/env ruby

require 'json'
require_relative 'model'
require_relative 'common'

def notebook_prefix
  "### "
end

def date_prefix
  "##### "
end


def notebooks_folder 
  File.join(project_base_folder, "notebooks")
end

def notebook_folder(notebook)
  File.join(notebooks_folder, notebook)
end

def get_local_notebooks
   entries = Dir.glob(File.join(notebooks_folder, "*"))
              .find_all{|f| File.directory? f}
              .map { |f| File.basename f }
   entries
end

def get_local_note_models(notebook)
  target_folder = notebook_folder(notebook)
  entries = Dir.glob(File.join(target_folder, "*")).find_all{|f| File.file? f}
  entries.each do |file|
    note = Note.new
    note.update_from_file(file)

  end

  entries

end

def get_readme_notebook_models() 
  local_notebooks = get_local_notebooks

  readme_file = File.join(project_base_folder, "README.md")
  lines = File.open(readme_file){|f| f.readlines.reject {|l|l.strip.empty?}}

  notebooks = []
  lines.each do |line|
    if line.start_with? notebook_prefix
      puts line[notebook_prefix.size...-1].strip
    end
    if line.start_with? date_prefix
      puts line[date_prefix.size...-1].strip
    end
  end
end

notebooks = get_local_notebooks
notebooks.each do |notebook|
  get_local_note_models notebook
end




