
require 'rubygems'
require 'pathname'
require 'nokogiri'
require 'memoize'

class ProjectConfiguration
  extend Memoize
  
  MSBUILD_NAMESPACES = { 'n' => "http://schemas.microsoft.com/developer/msbuild/2003" }
  def initialize(project_file)
    @project_xml = Nokogiri::XML(open(project_file))
  end
  
  def assembly
    xpath_node_value("//n:Project/n:PropertyGroup/n:AssemblyName")
  end
  memoize :assembly
  
  def assembly_type
    xpath_node_value("//n:Project/n:PropertyGroup/n:OutputType")
  end
  memoize :assembly_type

  def configuration
    xpath_node_value("//n:Configuration") 
  end
  memoize :configuration

  def output_path
    xpath_node_value("//n:PropertyGroup[contains(@Condition, '#{configuration}')]/n:OutputPath")
  end
  memoize :output_path
  
  def test?
    xpath_nodes("//n:Reference[contains(@Include,'nunit.framework')]").length > 0
  end
  memoize :test?
  
  private
  def xpath_node_value(xpath)
    xpath_nodes(xpath).first.text
  end
  
  def xpath_nodes(xpath)
    @project_xml.xpath(xpath, MSBUILD_NAMESPACES )
  end       
  
end
