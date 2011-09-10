class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: params[:email]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to members_root_url, :notice => "Logged In!"
    else
      flash.now.alert = "Invalid credentials"
      render "new"
    end
  end
end
