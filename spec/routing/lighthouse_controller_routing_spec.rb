require "spec_helper"

describe LighthouseController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/lighthouse/cippa/cioppa" }.should route_to(:controller => "lighthouse", :action => "index", :user => "cippa", :project => "cioppa")
    end

    it "should allow empty parameters" do
      { :get => "/lighthouse" }.should route_to(:controller => "lighthouse", :action => "index")
    end
  end
end
