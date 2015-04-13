class AddHorseidToTask < ActiveRecord::Migration
  def change
    add_reference :tasks, :horse, index: true
  end
end
