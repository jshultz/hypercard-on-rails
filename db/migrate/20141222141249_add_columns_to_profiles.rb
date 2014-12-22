class AddColumnsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :title, :text
    add_column :profiles, :tagline, :text
    add_column :profiles, :random, :text
  end
end
