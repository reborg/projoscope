require 'spec_helper'

describe "home/index.html.erb" do
  it 'should just say welcome' do
    render
    rendered.should =~ /welcome/i
  end
end
