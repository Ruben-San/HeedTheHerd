class AddUserRefToHorses < ActiveRecord::Migration
  def change
    add_reference :horses, :user, index: true
    add_foreign_key :horses, :users
  end
end
