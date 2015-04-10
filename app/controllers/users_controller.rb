class UsersController < ApplicationController
  def profile
    @user = current_user
  end

  def index
  end

  def show
  end
end
