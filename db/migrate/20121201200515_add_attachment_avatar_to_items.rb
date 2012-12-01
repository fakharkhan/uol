class AddAttachmentAvatarToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :items, :avatar
  end
end
