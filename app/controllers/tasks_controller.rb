class TasksController < ApplicationController
  before_action :authenticate_user!

  def index

    @tasks = Task.all
  end


  def show
    @task= Task.find(params[:id])
  end

  def new
    @task = Task.new
    @horses = current_user.horses.all
  end

  def create
    @horses = params[:task][:horses][:ids].reject!(&:blank?)
    @horses.each do |horse|
      @task = current_user.tasks.build(task_params)
      @task.horse_id = horse.to_i
      if
        @task.save
      else
        break
        render :new
      end
    end
      redirect_to profile_path
    
  end

  def edit
    if @task.user != current_user
      redirect_to @link, notice: "You do not have permission to edit this task."
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit
    end
  end

  def destroy
    if @task.user == current_user
      @task.destroy
    else
      redirect_to @user, notice: "You do not have permission to remove this task."
    end
  end

  

  private

  

  def task_params
    params.require(:task).permit(:name, :description, :duedate, :completed, :horse_id, :pic)
  end

end

