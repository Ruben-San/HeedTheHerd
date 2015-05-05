require 'rails_helper'
  RSpec.describe User, type: :model do
    it 'is invalid without an correct parameters' do
      expect(build(:user, email: nil)).to_not be_valid
      expect(build(:user, password: nil)).to_not be_valid
      expect(build(:user, zipcode: nil)).to_not be_valid
  end
end