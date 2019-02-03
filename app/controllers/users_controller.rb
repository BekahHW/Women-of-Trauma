class UsersController < ApplicationController
  def welcome
    @user = current_user.id
  end

  def show
    @user = User.find(params[:id])

  end
end
