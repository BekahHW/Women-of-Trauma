class UserDisordersController < ApplicationController
  def index
    @user_disorders = UserDisorder.limit(10)
end

  # def new
  #   @user_disorder = current_user.disorder.user_disorders.build
  #   @disorder = @user_disorder.disorder.last
  #
  # end
  #
  # def create
  #   @user_disorder = current_user.user_disorders.build(user_disorder_params)
  #   @user_disorder.disorder_id
  #    if @user_disorder.save
  #      redirect user_disorder_path(@user_disorder)
  #    else
  #      render :new
  #    end
  # end

#
#   def edit
#     @user_disorder = UserDisorder.find(params[:id])
#   end
#
#   def update
#     @user_disorder = UserDisorder.find(params[:id])
#     @user_disorder.update(params.require(:user_disorder))
#     redirect_to user_disorder_path(@user_disorder)
#
#   end
#
  def show
    @user_disorder = UserDisorder.find(params[:id])
  end
#
  private
    def user_disorder_params
      params.require(:user_disorder).permit(:narrative, :user_id, :disorder_id)
    end
end
