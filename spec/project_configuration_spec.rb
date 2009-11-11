require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe ProjectConfiguration do
  describe "should have attributes based on projects specification" do
      before(:each) do
        @configurations = Solution.new("test_projects/SampleCSharpSolution/SampleCSharpSolution.sln").projects.collect(&:configuration)
      end

      it 'has assembly ' do
        @configurations.collect(&:assembly).should == ["SampleCSharpLibraryProject", "SampleCSharpLibraryProjectTest"]
      end

      it 'has assembly_type' do
        @configurations.collect(&:assembly_type).should == ["Library", "Library"]
      end

      it 'has output_path based on active configuration' do
        @configurations.collect(&:output_path).should == ["bin\\Debug", "bin\\Debug"]
      end

      it 'is a test when reference to nunit found' do
        @configurations.select{|configuration| configuration.assembly == "SampleCSharpLibraryProject"}.first.should_not be_test
        @configurations.select{|configuration| configuration.assembly == "SampleCSharpLibraryProjectTest"}.first.should be_test
      end
  end

end