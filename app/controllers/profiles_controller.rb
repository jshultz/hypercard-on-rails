class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @profile = Profile.find(@user.id)
  end

  def edit
    @user = User.find(params[:id])
    @profile = Profile.find_or_create_by(id: params[:id], user_id: current_user.id)
    @profile.profile_theme = ProfileTheme.find_or_create_by(profile_id: current_user.id)

    if params[:code]
      @oauth = Koala::Facebook::OAuth.new(Settings.facebook.app_id, Settings.facebook.app_secret, "http://#{request.host_with_port}/profiles/#{current_user.id}/edit")

      # acknowledge code and get access token from FB
      session[:access_token] = @oauth.get_access_token(params[:code])

      @user.update_attributes(:facebooktoken => session[:access_token])
    end

  end

  def update

    params[:user_id] = current_user.id

    profile = Profile.find params[:id]
    if profile.update(profile_params)

      if profile.profile_theme.nil?

        if profile.build_profile_theme(profile_theme_params)

          profile.save

        end

      else

        profile.profile_theme.update_attributes(profile_theme_params)

      end

      redirect_to user_path current_user.id
    else
      # error handling
    end

  end

  def authorize_facebook

    @oauth = Koala::Facebook::OAuth.new(Settings.facebook.app_id, Settings.facebook.app_secret, "http://#{request.host_with_port}/profiles/#{current_user.id}/edit")
    @auth_url =  @oauth.url_for_oauth_code(:permissions=>"read_stream")
    puts session.to_s + "<<< session"

    redirect_to @auth_url

  end


  private

  def profile_params
    params.require(:profile).permit(:id, :first_name, :last_name, :date_of_birth, :user_id, :avatar, :profilebg, :profilevideo, :twitteruser, :facebookuser, :title, :tagline, :random, :profilebgnophoto,
                                    :profile_theme_attributes => [ :id, :profileTextH1Color, :profileTextTitleColor, :profileTextTaglineColor, :profileMessageBGColor, :profilebgcolor, :profile_id])
  end

  def profile_theme_params
    params.require(:profile_theme).permit(:profileTextH1Color, :profileTextTitleColor, :profileTextTaglineColor, :profileMessageBGColor, :profilebgcolor, :profile_id)
  end



end
