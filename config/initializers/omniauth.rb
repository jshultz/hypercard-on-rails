Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.secrets.facebook_provider_key, Rails.application.secrets.facebook_provider_secret
  provider :twitter, Rails.application.secrets.twitter_provider_key, Rails.application.secrets.twitter_provider_secret

end
