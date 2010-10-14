require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HomeController do

  describe "the project does exist" do
    it "should render the chart" do
      get 'index', :project => 'ops'
      IssueTracking.stub(:project_by_name).and_return({})
      response.should render_template(:chart)
    end
    it "should assign the project" do
      IssueTracking.stub(:project_by_name).and_return({})
      get 'index', :project => 'ops'
      assigns(:project).should_not be_nil
    end
  end

  describe "the project does not exist" do
    it 'flashes an error message on page' do
      IssueTracking.stub(:project_by_name)
      get 'index', :project => 'ops'
      flash[:error].should_not be_nil
    end
    it 'flashes same error for empty projects' do
      get 'index'
      flash[:error].should =~ /not exist/i
    end
  end

end
