require 'rails_helper'


RSpec.describe TasksController, type: :controller do

before(:each) do
  @user = FactoryGirl.create(:user)
  sign_in @user 
  @horse = FactoryGirl.create(:horse)
  @horse2 = FactoryGirl.create(:horse, id: 2)
  @horse3 = FactoryGirl.create(:horse, id: 3)

 end


    it "has a valid factory" do
   expect(@user.valid?).to eq(true)
   end 

  describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
        expect(response).to have_http_status(200)
        expect(response).to render_template(:index)
      end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end

    it 'assigns the @task variable' do
      get :new
      @task = assigns(:task)
      assert @task.new_record?
    end
  end
  
  # describe "should create task for multiple horses simultaneously" do 
  #    it "adds a new task" do
     
  #     all_horses = {horse: @horse, horse: @horse2, horse: @horse3}
  #     @horses = all_horses.each do |horse|
  #      horse.id
  #    end
  #     binding.pry
  #     expect(@horses.count).to eq(3)

      # FactoryGirl.create(:task)
      # expect(Task.count).to eq(1)
     # end

# @horses = params[:task][:horses][:ids].reject!(&:blank?)
#     @horses.each do |horse|
#       @task = current_user.tasks.build(task_params)
#       @task.horse_id = horse.to_i
#       @task.maildate = @task.duedate.weeks_ago(1)
#       if @task.save
#       else
#         break
#         render :new
#       end
  
    # it 'redirects to the profile page on save' do
    #   post :create, {:task_id => @task.id, :horse_id => @horse.id}
    #   @task = assigns(:task)
    #   expect(response).to redirect_to(profile_path)
    # end   
  
end  
