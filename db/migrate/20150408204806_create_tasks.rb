class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.date :duedate
      t.date :maildate
      t.boolean :complete

      t.timestamps null: false
    end
  end
end
