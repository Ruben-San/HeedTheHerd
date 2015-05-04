require 'rails_helper'

RSpec.describe HorseWeightsController, type: :controller do
before(:each) do
 #@user = FactoryGirl.create(:user, :with_horse) 
 @horse= FactoryGirl.build(:horse)
 @horse_weight = FactoryGirl.create(:horse_weight)
end
  
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates the horse_weight' do
        post :create, horse_id: @horse.id , horse_weight: FactoryGirl.attributes_for(:horse_weight)
        expect(HorseWeight.count).to eq(1)
      end
      it 'redirects to the "show" action for the horse' do
        post :create, horse_weight: FactoryGirl.attributes_for(:horse_weight)
        expect(response).to redirect_to horse_path(@horse_weight.horse_id) 
      end
    end

    context 'with invalid attributes' do
      it 'does not create the horse_weight' do
        post :create, :id => 1, horse_weight: attributes_for(:horse_weight, weight: nil)
        expect(Vehicle.count).to eq(0)
      end

      it 're-renders the "new" view' do
        post :create, horse_weight: attributes_for(:horse_weight, weight: nil)
        expect(response).to render_template :new
      end
    end
  end

end
