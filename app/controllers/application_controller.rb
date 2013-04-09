class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

  helper_method :admin?, :current_admin_session, :current_admin, :current_user, :current_user_session
  
  private  

  def current_admin_session  
    return @current_admin_session if defined?(@current_admin_session)  
    @current_admin_session = AdminSession.find  
  end  
  
  def current_admin  
    return @current_admin if defined?(@current_admin)  
    @current_admin = (current_admin_session && current_admin_session.admin)
  end  

  def current_user_session
    return @current_user_session if defined?(@current_user_session)  
    @current_user_session = UserSession.find  
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = (current_user_session && current_user_session.user) || (current_admin_session && current_admin_session.admin)
  end

end  

