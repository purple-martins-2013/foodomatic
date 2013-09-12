class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      puts "I'm in blah 1"
      flash.notice = "Signed in!"
      sign_in_and_redirect user
    else
      puts "BLAH 2"
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
end