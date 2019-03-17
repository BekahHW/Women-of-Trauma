class UsersController < ApplicationController
  def welcome
    @user = current_user.id
    respond_to do |format|
        format.html { render :index}
        format.json { render json: @user }
      end
  end

  def show
    @user = User.find(params[:id])

  end
end
