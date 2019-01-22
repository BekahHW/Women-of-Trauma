class UsersController < ApplicationController
  def welcome
    @user = current_user.id
  end
end
