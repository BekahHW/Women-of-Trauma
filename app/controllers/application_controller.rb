class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index]

  def after_sign_in_path_for(resource)
      request.env['omniauth.origin'] || root_path
  end
  # private
  #   def current_user
  #     @current_user ||= User.find_by(id: session[:user_id])
  #   end
  #
  #   def logged_in?
  #     !!current_user
  #   end
end
