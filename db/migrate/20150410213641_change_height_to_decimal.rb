class ChangeHeightToDecimal < ActiveRecord::Migration
  def change
    change_column :horses, :height, :decimal
  end
end
