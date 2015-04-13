class AddAttachmentPicToHorses < ActiveRecord::Migration
  def self.up
    change_table :horses do |t|
      t.attachment :pic
    end
  end

  def self.down
    remove_attachment :horses, :pic
  end
end
