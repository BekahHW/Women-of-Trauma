class UserDisordersController < ApplicationController
  def index
    @user_disorders = UserDisorder.limit(10)
end

  def show
    @user_disorder = UserDisorder.find(params[:id])
  end

  private
    def user_disorder_params
      params.require(:user_disorder).permit(:narrative, :user_id, :disorder_id)
    end
end
