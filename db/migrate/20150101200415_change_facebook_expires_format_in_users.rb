class ChangeFacebookExpiresFormatInUsers < ActiveRecord::Migration
  def change
    change_column :users, :facebook_expires, :datetime
  end
end
