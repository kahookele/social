class SignUpController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # Compare this snippet from test/models/user_test.rb:
    # require "test_helper"
    #
    # class UserTest < ActiveSupport::TestCase
    #   test "should not save user without email" do
    #     user = User.new
    #     assert_not user.save, "Saved the user without an email"
    #   end
    # end
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Thank you for signing up!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :status)
  end
end
