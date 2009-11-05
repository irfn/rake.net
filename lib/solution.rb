class Solution
  def initialize(path)
    @path = path
  end

  def projects
    File.read(@path).gsub(/^Project.*?\nEndProject/).collect do |project_specification|
      Project.new("#{Pathname.new(@path).expand_path.parent}/#{project_path(project_specification).gsub("\\","/")}")
    end
  end
  
  private
  def project_path(specification)
    /^Project\("\{.+?\}"\) \= ".+?", "(\w+\\\w+\.csproj){1}", ".+?"\r\nEndProject$/.match(specification)[1]
  end
end
