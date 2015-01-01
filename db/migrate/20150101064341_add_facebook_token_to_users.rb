class AddFacebookTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebooktoken, :text
  end
end
