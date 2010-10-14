class HomeController < ApplicationController

  def index
    error = "Project ' #{params[:project]} ' does not exist in the issue tracking system"
    flash[:error] = error unless @project = IssueTracking.new.project_by_name(params[:project])
    render :template => 'home/chart' 
    flash.discard
  end

end
