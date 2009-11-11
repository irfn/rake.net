require 'rubygems'
require 'pathname'
require 'nokogiri'
require 'memoize'

class Project
  attr_accessor :configuration
  def initialize(project_file)
    @configuration = ProjectConfiguration.new(project_file)
  end
  
end
