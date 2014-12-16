class Profile < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar,
                    :url => "/images/:attachment/:id_:basename.:extension",
                    :path => ":rails_root/public/images/:attachment/:id_:basename.:extension",
                    :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/images/:style/missing.jpg"
  has_attached_file :profilebg,
                    :url => "/images/:attachment/:id_:basename.:extension",
                    :path => ":rails_root/public/images/:attachment/:id_:basename.:extension",
                    :styles => { :large => "1440x900", :medium => "960x600", :thumb => "100x100>" }, :default_url => "/assets/images/:style/default-bg.jpg"
  has_attached_file :profilevideo,
                    :url => "/images/:attachment/:id_:basename.:extension",
                    :path => ":rails_root/public/images/:attachment/:id_:basename.:extension",
                    :styles => {
                               :large => { :geometry => "1920x1080", :format => 'mp4' },
                               :thumb => { :geometry => "1920x1080#", :format => 'jpg', :time => 10 }
                           }, :processors => [:transcoder]

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :profilebg, :content_type => /\Aimage\/.*\Z/
end
