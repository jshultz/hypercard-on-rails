class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @profile = Profile.find(params[:id])
    @twitterfeed = twitter_news(@user.profile.twitteruser) if @user.profile.twitteruser.present?
  end

  def edit
    @user = User.find(params[:id])
    @profile = Profile.find_or_create_by(id: params[:id])
  end

  def twitter_news(twitter_user)
    binding.pry
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = Settings.twitter.consumer_key
      config.consumer_secret = Settings.twitter.consumer_secret
      config.access_token = Settings.twitter.oauth_token
      config.access_token_secret = Settings.twitter.oauth_token_secret
    end
    @tweet_news = client.user_timeline(twitter_user, {count: 5})

  end

end
