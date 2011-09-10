class Members::ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery
  layout "members"

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    if current_user.nil?
      redirect_to login_url, :alert => "You must first log in to access this page"
    end
  end

  helper_method :current_user
end
