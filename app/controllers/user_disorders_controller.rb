class UserDisordersController < ApplicationController
  def index
    @user_disorders = UserDisorder.limit(10)
  end

  def new
    @user_disorder = UserDisorder.new
  end

  def create
    @user_disorder = UserDisorder.new(user_disorder_params)
     if @user_disorder.valid?
       @user_disorder.save
       redirect user_disorder_path(@user_disorder)
     else
       render :new
     end
  end

  def edit
    @user_disorder = UserDisorder.find(params[:id])
  end

  def update
    @user_disorder = UserDisorder.find(params[:id])
    @user_disorder.update(params.require(:user_disorder))
    redirect_to user_disorder_path(@user_disorder)

  end

  def show
    @user_disorder = UserDisorder.find(params[:id])
  end

  private
    def user_disorder_params
      params.require(:user_disorder).permit(:narrative)
    end
end
