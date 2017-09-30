class UsersController < ApplicationController

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # sign in the user
      session[:user_id] = @user.id
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:first_name,
                                    :last_name,
                                    :email,
                                    :profile_picture,
                                    :password,
                                    :password_confirmation
                                  )
    end

end
