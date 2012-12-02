class AddAttachmentPhotoToAuctions < ActiveRecord::Migration
  def self.up
    change_table :auctions do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :auctions, :photo
  end
end
