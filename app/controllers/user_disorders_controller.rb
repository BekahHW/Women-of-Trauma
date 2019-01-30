class UserDisordersController < ApplicationController
  def index
    @user_disorders = UserDisorder.all
    # @user_disorder = @disorder.user_disorders
  end

  def new
    # @disorder = Disorder.new
    @user_disorder = UserDisorder.new
    # @user_disorder.disorder.create(user_id: current_user)
  end

  def create
    # @disorder = Disorder.new(disorder_params)
    @user_disorder = current_user.user_disorders.new(user_disorder_params)
     if @user_disorder.save
       redirect_to user_disorders_path
     else
       render :new
     end
  end

  def show
    @user_disorder = UserDisorder.find(params[:id])
  end

  private
    def user_disorder_params
      params.require(:user_disorder).permit(:narrative, :user_id, :disorder_id)
    end
end
