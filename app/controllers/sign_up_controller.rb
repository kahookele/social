class SignUpController < ApplicationController

  def new
    @user = User.new
  end

  def create
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end
end
