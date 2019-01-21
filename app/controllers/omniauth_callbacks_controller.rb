class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    omniauth = request.env["omniauth.auth"]
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
    redirect root_path, :notice => "Welcome, #{@user.name}"
  end
end
