class CreateTaskAssignments < ActiveRecord::Migration
  def change
    create_table :task_assignments do |t|
      t.integer :horse
      t.integer :task

      t.timestamps null: false
    end
  end
end
