class UsersController < ApplicationController
  def welcome
    @user = current_user
    # respond_to do |format|
    #     format.html { render :index}
    #     format.json { render json: @user }
    #   end
  end

  def show
    @user = User.find(params[:id])

  end

#   def current_user
#     render json: {name: current_user.name}
# end
end
