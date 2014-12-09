class Profile < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/images/:style/missing.jpg"
  has_attached_file :profilebg, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/images/:style/missing.jpg"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :profilebg, :content_type => /\Aimage\/.*\Z/
end
