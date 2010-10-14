require 'lighthouse'
require 'time'

class IssueTracking
  attr_reader :account, :username, :password, :token

  def initialize
    @account = 'rails'
    @username = 'reborg'
    @password = 'coolindeed'
    authenticate 
  end

  def project_by_name(name)
    Lighthouse::Project.find(:all).select {|p| p.name.downcase == name.downcase.gsub(/-/, " ")}.first if name
  end

  def open_tickets_create_dates_for(project_name)
    project = project_by_name(project_name) 
    project.tickets.collect(&:created_at).sort if project
  end

  def group_by_day(dates)
    dates.inject({}) do |a,d|
      key = d.day.to_s + "/" + d.month.to_s
      a[key] ? (a[key] += 1) : (a[key] = 1)
      a
    end
  end

  def open_tickets_count_as_csv_for(project_name)
    reduce = group_by_day(open_tickets_create_dates_for(project_name))
    reduce.collect {|k,v| "#{k};#{v}" }.join("\\n")
  end

  private 
    
  def authenticate
    Lighthouse.account = 'rails'
    @token ||= Lighthouse.authenticate(username, password)
  end

end
