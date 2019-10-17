class OmniauthController < ApplicationController

#data entered on third party site is available via the request environment variable which is being passed to the create_from_provider_data method

#if user is saved to the database, flash message via set_flash_message helper provided by Devise, sign the user in and redirect them to their homepage.
#if user is not saved to the database, flash error message and redirect user to registration page

# facebook callback
def facebook
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end 
  end

# google callback
def google_oauth2
    @user = User.create_from_google_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    else
      flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end 
end

#if authentication fails or redirection failed or the user did not grant permissions to app
def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later.' 
    redirect_to new_user_registration_url
end


end
