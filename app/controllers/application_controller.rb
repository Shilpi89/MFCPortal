class ApplicationController < ActionController::Base
  
  protect_from_forgery
  before_filter :authenticate_user!

  def after_sign_in_path_for(user)
    welcome_events_path
  end

  #rescue_from CanCan::AccessDenied do |exception|
  #flash[:alert] = exception.message
  #redirect_to root_url
	#end

end
