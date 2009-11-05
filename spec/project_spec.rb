require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Project do

  it 'should have attributes based on project specification' do
    solution = Solution.new("test_projects/SampleCSharpSolution/SampleCSharpSolution.sln")
    projects = solution.projects
    projects.collect(&:assembly).should == ["SampleCSharpLibraryProject", "SampleCSharpLibraryProjectTest"]
    projects.collect(&:assembly_type).should == ["Library", "Library"]
    projects.select{|project| project.assembly == "SampleCSharpLibraryProjectTest"}.should be_test_assembly
  end

  it 'should have project types based on convention of Name ending with Test' do
    pending
  end

end
