#!/usr/bin/env ruby

require 'json'
require_relative 'model'

def project_json_path(name)
  File.join(project_base_folder, "iCards/iCards/Resource/json", "#{name}.json")
end

def update_notebooks_json_files
  models = get_local_notebooks_models
  notebooks = []
  models.each do |notebook|
    notebooks << notebook.to_short_dict
    notebook.notes = notebook.notes.map{|e| e.to_dict}
    json = {:data => notebook.to_dict}.to_json
    json_file_path = project_json_path(notebook.name)
    File.open(json_file_path, 'w'){|f| f.write json}
  end

  json = {:data => notebooks}.to_json
  path = project_json_path("notebooks")
  File.open(path, "w"){|f| f.write json}
end

# generate models and update json files
update_notebooks_json_files