class AddHorseRefToHorseWeight < ActiveRecord::Migration
  def change
    add_reference :horse_weights, :horse, index: true
    add_foreign_key :horse_weights, :horses
  end
end
