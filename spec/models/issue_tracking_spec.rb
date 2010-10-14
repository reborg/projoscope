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

  describe "aggregating data" do

    let(:ticket) {stub('ticket', :created_at => "2010-08-12 09:28:41 UTC")}
    let(:project) {stub('project', :name => "project_name", :tickets => [ticket]*3)}
    
    it 'retrieves all open tickets create date' do
      Lighthouse::Project.stub(:find).and_return([project])
      open_tickets = issue_tracking.open_tickets_create_dates_for("project_name")  
      open_tickets.size.should == 3
      open_tickets.first.should =~ /2010-08-12/
    end

    it 'counts tickets for the same date' do
      dates = [Date.parse("2010-08-13 09:28:41 UTC")]*2
      issue_tracking.group_by_day(dates)["13/8"].should == 2
    end

  end

end
