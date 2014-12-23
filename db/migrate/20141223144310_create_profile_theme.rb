class CreateProfileTheme < ActiveRecord::Migration
  def change
    create_table :profile_themes do |t|
      t.text :profileTextH1Color
      t.text :profileTextTitleColor
      t.text :profileTextTaglineColor
      t.text :profileMessageBGColor
    end
  end
end
