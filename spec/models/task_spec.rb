require 'rails_helper'
  RSpec.describe Task, type: :model do
  it 'has a valid factory' do
      expect(build(:task)).to be_valid
  end

  it 'tasks belong to horses' do
    expect(build(:task, horse_id: nil)).to_not be_valid
  end


end