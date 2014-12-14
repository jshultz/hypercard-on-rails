class Video < ActiveRecord::Base
  belongs_to :user

  has_attached_file :profilevideo, :styles => {
                               :medium => { :geometry => "640x480", :format => 'mp4' }
                                 }, :processors => [:transcoder]

  validates_attachment_content_type :profilevideo, :content_type => ["video/mp4", "video.mov", "video/mpeg","video/mpeg4", "image/jpg", "image/jpeg"]

end
