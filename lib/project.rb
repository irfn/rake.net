require 'rubygems'
require 'pathname'
require 'nokogiri'
require 'memoize'

class Project
  extend Memoize
  
  MSBUILD_NAMESPACES = { 'n' => "http://schemas.microsoft.com/developer/msbuild/2003" }
  def initialize(project_file)
    @project_xml = Nokogiri::XML(open(project_file))
  end
  
  def assembly
    xpath_node_value("//n:Project/n:PropertyGroup/n:AssemblyName")
  end
  
  def assembly_type
    xpath_node_value("//n:Project/n:PropertyGroup/n:OutputType")
  end
  
  def xpath_node_value(xpath)
      @project_xml.xpath(xpath, MSBUILD_NAMESPACES ).first.text
  end
  
  def test?
    @project_xml.xpath("//n:Reference[contains(@Include,'nunit.framework')]", MSBUILD_NAMESPACES ).length > 0
  end
  memoize :assembly
end
