class UsersController < ApplicationController
  before_filter :authenticate_user!, except: :show
  before_filter :correct_user?, :except => [:index, :show]

  def index
    @users = User.all
  end

  def show
    @oauth = Koala::Facebook::OAuth.new(Settings.facebook.app_id, Settings.facebook.app_secret, "http://localhost:3000/users/#{current_user.id}")

    # if params[:code]
    #
    #   # acknowledge code and get access token from FB
    #   session[:access_token] = @oauth.get_access_token(params[:code])
    #
    #   access_token = @oauth.get_access_token_info(params[:code])
    #
    # end
    #
    app_access_token = @oauth.get_app_access_token
    #
    # # auth established, now do a graph call:
    #
    # @api = Koala::Facebook::API.new(session[:access_token])



    begin
      @graph_data = @api.get_object("/me/statuses", "fields"=>"message")
    rescue Exception=>ex
      puts ex.message
    end

    @graph = Koala::Facebook::API.new(app_access_token)

    @current_user = User.find(current_user.id) if user_signed_in?
    @user = User.find(params[:id])
    @profile = Profile.find(params[:id])

    @twitterfeed = twitter_news(@user.profile.twitteruser) if @user.profile.twitteruser.present?
    begin
      @facebookfeed = @graph.get_connection(@user.profile.facebookuser,"feed") if !@user.profile.facebookuser.blank?
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
