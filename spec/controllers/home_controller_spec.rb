require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HomeController do

  describe "the project does exist" do
    before(:each) do
      IssueTracking.stub(:new).and_return(stub('issue_tracking', :project_by_name => {}))
      get 'index', :project => 'ops'
    end
    it "should render the chart" do
      response.should render_template(:chart)
    end
    it "should assign the project" do
      assigns(:project).should_not be_nil
    end
  end

  describe "the project does not exist" do
    before(:each) do
      IssueTracking.stub(:new).and_return(stub('issue_tracking', :project_by_name => nil))
    end
    it 'flashes an error message on page' do
      get 'index', :project => 'ops'
      flash[:error].should_not be_nil
    end
    it 'flashes same error for empty projects' do
      get 'index'
      flash[:error].should =~ /not exist/i
    end
  end

end
