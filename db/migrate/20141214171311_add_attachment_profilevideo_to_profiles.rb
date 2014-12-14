class AddAttachmentProfilevideoToProfiles < ActiveRecord::Migration
  def self.up
    change_table :profiles do |t|
      t.attachment :profilevideo
    end
  end

  def self.down
    remove_attachment :profiles, :profilevideo
  end
end
