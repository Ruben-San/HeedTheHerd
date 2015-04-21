require 'rails_helper'

RSpec.describe User, type: :model do

  # it 'has a valid factory' do
  #   expect(build(:user)).to be_valid
  # end

  it 'has a valid email' do
    expect(build(:user, email: nil)).to_not be_valid
  end

    it 'has a valid password' do
    expect(build(:user, encrypted_password: nil)).to_not be_valid
  end

    it 'it has a valid zip code' do
    expect(build(:user, zipcode: nil)).to_not be_valid
    
  end
end
