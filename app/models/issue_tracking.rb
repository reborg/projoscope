require 'lighthouse'

class IssueTracking
  attr_reader :account, :username, :password, :token

  def initialize
    @account = 'rails'
    @username = 'reborg'
    @password = 'coolindeed'
    authenticate 
  end

  def project_by_name(name)
    Lighthouse::Project.find(:all).select {|p| p.name.downcase == name.gsub(/-/, " ")}.first
  end

  private 
    
  def authenticate
    Lighthouse.account = 'rails'
    @token ||= Lighthouse.authenticate(username, password)
  end

end
