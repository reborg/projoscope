require 'spec_helper'
require 'lighthouse'

describe IssueTracking do

  let(:issue_tracking) {IssueTracking.new}

  before(:each) do
   Lighthouse.stub(:authenticate).and_return("something") 
  end

  describe "at initialization" do

    it 'should initialize lighthouse credentials' do
      issue_tracking.account.should_not be_nil
      issue_tracking.username.should_not be_nil
      issue_tracking.password.should_not be_nil
    end

    it 'lazy initializes the auth token' do
      issue_tracking.token.should_not be_nil
    end

  end

  describe "finding a project" do
     
    it 'should find a project by name' do
      Lighthouse::Project.stub(:find).and_return([stub('project', :name => "ruby on rails")])
      issue_tracking.project_by_name("ruby-on-rails").should_not be_nil
    end

    it 'should not complain for nil project names' do
      Lighthouse::Project.stub(:find).and_return(nil)
      issue_tracking.project_by_name(nil).should be_nil
    end

  end

end
