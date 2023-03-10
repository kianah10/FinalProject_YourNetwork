class ProfileController < ApplicationController
  #skip_before_action(:force_user_sign_in, { :only => [:user_profile] })
  #before_action :authenticate_user!
    
  def user_profile
      render(:template => "profile/my_profile.html.erb")
    end
  end
