#!/usr/bin/env ruby

require 'json'
require_relative 'common'

module JSONable
  def to_s
    to_json
  end
  def to_json
    to_dict.to_json
  end

  def to_dict
    hash = {}
    self.instance_variables.each do |var|
      key = var[1..-1]
      hash[key] = self.instance_variable_get var
    end
    hash
  end

  def from_dict! dict
    dict.each do |var, val|
      key = "@#{var}"
      self.instance_variable_set key, val
    end
  end

  def from_json! string
    from_dict! JSON.load(string)
  end
end

class Readme
  include JSONable
  attr_accessor :name
end


class Note
  include JSONable
  attr_accessor :title, :from, :create, :update, :tags
  attr_accessor :file_name, :content

  def update_from_file(file)
    @file_name = File.basename file

    file_content = File.open(file){|f| f.read}
    meta_regex = /<!--[^>]*>/
    meta_content = file_content.scan(meta_regex).first[4...-3].strip
    meta_info = {}
    meta_content.split("\n").each do |line|
      key, value = line.split(":")
      meta_info[key.strip] = value.strip
    end
    
    self.from_dict! meta_info

    @content = file_content[meta_content.size...-1].strip

    puts self.to_json
  end
end

class Notebook
  include JSONable
  attr_accessor :name


end

