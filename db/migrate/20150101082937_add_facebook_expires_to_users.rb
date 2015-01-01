class AddFacebookExpiresToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_expires, :text
    rename_column :users, :facebooktoken, :facebook_token
  end
end
