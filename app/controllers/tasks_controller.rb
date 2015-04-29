class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
     @tasks = Task.all.order(:duedate)
  end

  def show
    @task = Task.find(params[:id])
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
      @task.maildate = @task.duedate.weeks_ago(1)
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
    @task =Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
       redirect_to profile_path
    else
      render :edit 
    end
  end

  def destroy 
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to profile_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :duedate, :completed, :horse_id, :pic, :maildate)
  end

end