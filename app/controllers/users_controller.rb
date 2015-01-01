class UsersController < ApplicationController
  before_filter :authenticate_user!, except: :show
  before_filter :correct_user?, :except => [:index, :show]

  def index
    @users = User.all
  end

  def show
    @current_user = User.find(current_user.id) if user_signed_in?
    @user = User.find(params[:id])
    @profile = Profile.find(params[:id])

    @twitterfeed = twitter_news(@user.profile.twitteruser) if @user.profile.twitteruser.present?
    begin
      @api = Koala::Facebook::API.new(@user.facebook_token) if @user.facebook_token.present?
      @facebookfeed = @api.get_connection(@user.profile.facebookuser,"feed") if !@user.profile.facebookuser.blank? && @user.facebook_token.present?
    rescue Exception=>ex

    end
  end

  def edit
    @user = User.find(params[:id])
    @profile = Profile.find_or_create_by(id: params[:id])

  end

  def twitter_news(twitter_user)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = Settings.twitter.consumer_key
      config.consumer_secret = Settings.twitter.consumer_secret
      config.access_token = Settings.twitter.oauth_token
      config.access_token_secret = Settings.twitter.oauth_token_secret
    end
    @tweet_news = client.user_timeline(twitter_user, {count: 5})

  end

end
