class UsersController < ApplicationController
  def profile
    @user = current_user
  end

  def index
    @users = User.all
  end

  def show
  end
end
