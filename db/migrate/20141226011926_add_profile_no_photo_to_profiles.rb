class AddProfileNoPhotoToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :profilebgnophoto, :boolean
  end
end
