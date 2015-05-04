require 'rails_helper'


RSpec.describe TasksController, type: :controller do

before(:each) do
  @user = FactoryGirl.create(:user)
  sign_in @user 
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
  
  describe "Post create" do 
    it "adds a new task" do
      # @horses = Horse.last.id

     expect{
       # @horses = params[:task][:horses][:ids].reject!(&:blank?)
       @horse = Horse.first
          post :create, {:task => @task, :horse_id => @horse.id}
        }.to change(Task, :count).by(1)
     end

  
    it 'redirects to the profile page on save' do
      post :create, {:task_id => @task.id, :horse_id => @horse.id}
      @task = assigns(:task)
      expect(response).to redirect_to(profile_path)
    end   
  end
end  
