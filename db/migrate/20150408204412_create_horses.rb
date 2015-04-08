class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :name
      t.string :breed
      t.float :height
      t.integer :weight
      t.date :DOB
      t.integer :RHR
      t.string :gender

      t.timestamps null: false
    end
  end
end
