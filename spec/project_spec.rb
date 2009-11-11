require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Project do
  before(:each) do
    @projects = Solution.new("test_projects/SampleCSharpSolution/SampleCSharpSolution.sln").projects
  end
end
