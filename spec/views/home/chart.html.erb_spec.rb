require 'spec_helper'

describe "home/chart.html.erb" do
  it 'displays the flash message if available' do
    flash[:error] = 'error here'
    render
    ## FIXME: should contain does not work because there is no 
    #capybara installed http://forums.pragprog.com/forums/95/topics/7026
    # but have_content doesn't work either.
    rendered.should =~ /error here/
  end
end