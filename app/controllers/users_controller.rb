class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  pp @user
    if @user.save 
      session[:user_id] = @user.id 
      redirect_to "/" # Redirect to the user's profile page (or another page)
    else
      puts @user.errors.full_messages 
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
