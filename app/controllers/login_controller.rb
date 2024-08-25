class LoginController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)

    if user && user.authenticate(params[:password])
      # create the session
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in Successfully!"
    else
      flash[:alert] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end
end