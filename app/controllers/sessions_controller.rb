class SessionsController < ApplicationController
  def new
    # Render the login form view
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      # Successful login
      log_in user
      redirect_to root_path # Or redirect to a different page (e.g., root_path)
    else
      # Invalid login
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path  # Redirect to the login page or another appropriate page
  end
end
