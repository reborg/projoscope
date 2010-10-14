require "spec_helper"

describe HomeController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/myproject" }.should route_to(:controller => "home", :action => "index", :project => "myproject")
    end

  end
end
