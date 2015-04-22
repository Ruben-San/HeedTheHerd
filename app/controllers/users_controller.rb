class UsersController < ApplicationController
  def profile
    @user = current_user
    # @assigned_tasks = Task.where(assigned_user_id: current_user)
    # @tasks = Task.find_by(params[:task_id])
    
    @tasks = []
    current_user.tasks.each_index do |index|
      if index < 3
        @tasks.push(current_user.tasks[index])
      end
    end

    @horses = []
    @tasks.each do |task|
      @horses.push(Horse.find(task.horse_id))
    end
  end

  def index
    @users = User.all
  end

  def show

  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password, :zipcode)
  end

end