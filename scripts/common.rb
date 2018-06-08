#!/usr/bin/env ruby

require_relative 'model'
require 'date'

def today
  Date.today.to_s
end

def project_base_folder
  File.expand_path("#{$0}/../../", Dir.pwd)
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
              .sort
  entries
end

def get_local_notebooks_models
  notebooks_names = get_local_notebooks
  models = notebooks_names.map do |notebook_name|
    notebook = Notebook.new
    notebook.name = notebook_name
    note_models = get_local_note_models notebook_name
    notebook.notes = note_models
    notebook
  end
  models
end

def get_local_note_models(notebook)
  target_folder = notebook_folder(notebook)
  entries = Dir.glob(File.join(target_folder, "*")).find_all{|f| File.file? f}
  models = entries.map do |file|
    note = Note.new
    note.update_from_file(file)
    note
  end
  models.sort! {|lhs, rhs| lhs.title <=> rhs.title}
  models.sort! {|lhs, rhs| rhs.create <=> lhs.create}
  models
end
