class SessionsController < ApplicationController

  def new
    redirect_to '/auth/facebook'
  end

  def facebook
    redirect_to '/auth/facebook'
  end

  def twitter
    redirect_to '/auth/twitter'
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    reset_session
    session[:user_id] = user.id

    if Profile.where(:user_id => user.id).present?
      return redirect_to root_url, :notice => 'Signed in!'
    else
      redirect_to edit_profile_path user.id
    end

  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
