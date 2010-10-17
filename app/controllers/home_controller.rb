class HomeController < ApplicationController

  def index
    ## FIXME: introspect the controller list to find out which are
    # registered.
    @systems = ["lighthouse"]
  end

end
