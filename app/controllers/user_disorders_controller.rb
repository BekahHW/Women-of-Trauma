class UserDisordersController < ApplicationController
  def index
    @disorder = Disorder.find_by_id(params[:disorder_id])
    @user_disorders = @disorder.user_disorders
  end

  def show
    @user_disorder = UserDisorder.find(params[:id])
  end

  private
    def user_disorder_params
      params.require(:user_disorder).permit(:narrative, :user_id, :disorder_id)
    end
end
