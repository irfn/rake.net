require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Project do
  describe "should have attributes based on projects specification" do
      before(:each) do
        @projects = Solution.new("test_projects/SampleCSharpSolution/SampleCSharpSolution.sln").projects    
      end

      it 'has assembly ' do
        @projects.collect(&:assembly).should == ["SampleCSharpLibraryProject", "SampleCSharpLibraryProjectTest"]
      end

      it 'has assembly_type' do
        @projects.collect(&:assembly_type).should == ["Library", "Library"]
      end

      it 'has output_path based on active configuration' do
        @projects.collect(&:output_path).should == ["bin\\Debug", "bin\\Debug"]
      end

      it 'is a test when reference to nunit found' do
        @projects.select{|project| project.assembly == "SampleCSharpLibraryProject"}.first.should_not be_test
        @projects.select{|project| project.assembly == "SampleCSharpLibraryProjectTest"}.first.should be_test
      end
  end

end
