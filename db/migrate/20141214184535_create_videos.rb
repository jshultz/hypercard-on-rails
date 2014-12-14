class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.attachment :profilevideo
      t.timestamps
    end
  end
end
