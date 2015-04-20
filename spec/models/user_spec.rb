require 'rails_helper'
  RSpec.describe User, type: :model do
    it 'is invalid withoout an email' do
      expect(build(:user, email: nil)).to_not be_valid
  end
  
end