require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Solution" do
  before(:each) do
    @solution = Solution.new("test_projects/SampleCSharpSolution/SampleCSharpSolution.sln")    
  end
  
  it "should list the included projects" do
    ["SampleCSharpLibraryProject", "SampleCSharpLibraryProjectTest"].each { |project_name|
      Project.should_receive(:new).with(Pathname.new(location(project_name)).expand_path.to_s)
    }
    
    @solution.projects.should have(2).things 
  end 
  
  def location(project_name)
    "#{File.dirname(__FILE__)}/../test_projects/SampleCSharpSolution/#{project_name}/#{project_name}.csproj"    
  end
end
