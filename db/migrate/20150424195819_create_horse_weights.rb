class CreateHorseWeights < ActiveRecord::Migration
  def change
    create_table :horse_weights do |t|
      t.integer :weight
      t.date :date

      t.timestamps null: false

    end
  end
end
