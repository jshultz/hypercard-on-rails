class AddProfileIdtoProfileThemes < ActiveRecord::Migration
  def change
    add_reference :profile_themes, :profile, index: true

  end
end
