class HomeController < ApplicationController

  def index
    message = "Project #{params[:project]} does not exist in the issue tracking system"
    flash[:error] = message unless @project = IssueTracking.project_by_name(params[:project])
    render :template => 'home/chart' 
  end

end
