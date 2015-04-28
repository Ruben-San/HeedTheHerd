class RamoveColumnFromHorse < ActiveRecord::Migration
  def change
    remove_column :horses, :weight
  end
end
