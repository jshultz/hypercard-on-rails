class AddProfileBgFieldsToProfileTheme < ActiveRecord::Migration
  def change
    add_column :profile_themes, :profilebgcolor, :text
  end
end
