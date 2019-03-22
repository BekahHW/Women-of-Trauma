class UserDisordersController < ApplicationController

  def index
    @user_disorders = UserDisorder.all
    respond_to do |format|
        format.html { render :index}
        format.json { render json: @user_disorders}
      end
 end

  def new
    @user_disorder = UserDisorder.new
  end

  def create
    @user_disorder = current_user.user_disorders.new(user_disorder_params)
    @user_disorder.save

    respond_to do |format|
        format.html { render :new}
        format.json { render json: @user_disorders }
      end
  end

  def show
    @user_disorder = UserDisorder.find(params[:id])
    if @user_disorder.nil?
      redirect_to disorder_user_disorders_path(@disorder), alert: "Disorder not found"
    end
  else
    @user_disorder = UserDisorder.find(params[:id])
    @user = @user_disorder.user
  end

  private


    def user_disorder_params
      params.require(:user_disorder).permit(:narrative, :user_id, :disorder_id)
    end
end
