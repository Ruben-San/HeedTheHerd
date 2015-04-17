class UsersController < ApplicationController
  def profile
    @user = current_user
    @assigned_tasks = Task.where(assigned_user_id: current_user)
    @tasks = Task.find_by(params[:task_id])
  end

  def index
    @users = User.all
  end

  def show
  end

end
