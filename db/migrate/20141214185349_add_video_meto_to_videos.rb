class AddVideoMetaToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :video_meta, :text
  end
end
