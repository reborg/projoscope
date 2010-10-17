class LighthouseController < ApplicationController

  def index
    error = "Project ' #{params[:project]} ' does not exist in the issue tracking system"
    @issue_tracking = IssueTracking.new
    flash[:error] = error unless @project = @issue_tracking.project_by_name(params[:project])
    render :template => 'lighthouse/chart' 
    flash.discard
  end

end
