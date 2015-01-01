class User < ActiveRecord::Base

  has_one :profile
  has_many :videos

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
    end
  end

  def facebook_token_expired?
    DateTime.now.utc > self.facebook_expires
  end

end
