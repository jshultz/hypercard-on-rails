class FixVideoMetaColuimnName < ActiveRecord::Migration
  def change
    rename_column :videos, :video_meta, :profilevideo_meta
  end
end
