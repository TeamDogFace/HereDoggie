class AddAttachmentPhotoToSearches < ActiveRecord::Migration
  def self.up
    change_table :searches do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :searches, :photo
  end
end
