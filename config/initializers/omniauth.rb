Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Settings.facebook.app_id, Settings.facebook.app_secret
  provider :twitter, Settings.twitter.consumer_key, Settings.twitter.consumer_secret

end
