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
  end

  def update
    binding.pry
    params[:user_id] = current_user.id
    profile = Profile.find params[:id]
    if profile.update(profile_params)
      redirect_to show
    else
      # error handling
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:id, :first_name, :last_name, :date_of_birth, :user_id, :avatar, :profilebg, :profilevideo, :twitteruser, :facebookuser)
  end



end
