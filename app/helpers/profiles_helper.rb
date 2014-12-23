module ProfilesHelper
  def setup_profile(profile)
    profile.profile_theme || ProfileTheme.new
    profile
  end
end