require 'rails_helper'

RSpec.describe HorseWeightsController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @horse= FactoryGirl.create(:horse)
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates the horse_weight' do
        post :create, horse_id: @horse.id , horse_weight: FactoryGirl.attributes_for(:horse_weight)
        expect(HorseWeight.count).to eq(1)
      end
      it 'redirects to the "show" action for the horse' do
        horse_weight = post :create, horse_id: @horse.id , horse_weight: FactoryGirl.attributes_for(:horse_weight)
        expect(response).to redirect_to horse_path(@horse.id) 
      end
    end
  
    context 'with invalid attributes' do
      it 'does not create the horse_weight' do
        post :create, horse_id: @horse.id , horse_weight: attributes_for(:horse_weight, weight: nil)
        expect(HorseWeight.count).to eq(0)
      end

      it 're-renders the "new" view' do
        post :create,horse_id: @horse.id, horse_weight: attributes_for(:horse_weight, weight: nil)
        expect(response).to render_template :new
      end
    end
  end
end
