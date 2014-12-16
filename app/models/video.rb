class Video < ActiveRecord::Base
  belongs_to :user

  has_attached_file :profilevideo,
                    :url => "/videos/:attachment/:id_:basename.:extension",
                    :path => ":rails_root/public/videos/:attachment/:id_:basename.:extension",
  :processors => [:transcoder]

  validates_attachment_content_type :profilevideo, :content_type => ["video/mp4", "video.mov", "video/mpeg","video/mpeg4", "image/jpg", "image/jpeg"]

end
