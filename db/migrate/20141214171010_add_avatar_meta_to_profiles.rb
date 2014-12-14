class AddAvatarMetaToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :avatar_meta, :text
    add_column :profiles, :profilebg_meta, :text
    add_column :profiles, :profilevideo_meta, :text
  end
end
