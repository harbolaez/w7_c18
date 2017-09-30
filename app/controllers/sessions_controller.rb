class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      # if the user is authenticate do soemthing
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "We can't authenticate this user"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
