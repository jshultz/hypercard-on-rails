class AddSocialMediaFieldsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :twitteruser, :text
    add_column :profiles, :facebookuser, :text
  end
end
