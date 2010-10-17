require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HomeController do

  describe "when no issue tracking system is specified" do
    before(:each) do
      get 'index'
    end
    it "should assign the list of systems currently supported" do
      assigns[:systems].should_not be_nil
    end
  end

end
