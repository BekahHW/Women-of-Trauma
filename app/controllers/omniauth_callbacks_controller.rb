class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    omniauth = request.env["omniauth.auth"]
    @user = User.from_omniauth(request.env["omniauth.auth"])
    # binding.pry
    sign_in_and_redirect @user, :notice => "Welcome, #{@user.name}"
    # redirect_to root_path, :notice => "Welcome, #{@user.name}"
  end
end
