require 'rails_helper'

RSpec.describe Horse, type: :model do

  it 'has a valid factory' do
    expect(build(:horse)).to be_valid
  end

  it 'validates all model content provided' do
    expect(build(:horse, user_id: nil)).to_not be_valid
    expect(build(:horse, name: nil)).to_not be_valid
    expect(build(:horse, breed: nil)).to_not be_valid
    expect(build(:horse, DOB: nil)).to_not be_valid
    expect(build(:horse, RHR: nil)).to_not be_valid
    expect(build(:horse, height: nil)).to_not be_valid
    expect(build(:horse, weight: nil)).to_not be_valid
    expect(build(:horse, gender: nil)).to_not be_valid
  end
end
