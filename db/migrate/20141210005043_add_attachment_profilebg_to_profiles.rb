class AddAttachmentProfilebgToProfiles < ActiveRecord::Migration
  def self.up
    change_table :profiles do |t|
      t.attachment :profilebg
    end
  end

  def self.down
    remove_attachment :profiles, :profilebg
  end
end
