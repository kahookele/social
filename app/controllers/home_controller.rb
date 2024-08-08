class HomeController < ApplicationController
  before_action :current_user

  def index
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
