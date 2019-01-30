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
    if params[:disorder_id]
      @disorder = Disorder.find(params[:disorder_id])
    @user_disorder = @disorder.user_disorders.find(params[:id])
    if @user_disorder.nil?
      redirect_to disorder_user_disorders_path(@disorder), alert: "Story not found"
    end
  else
    @user_disorder = UserDisorder.find(params[:id])
  end
end


  private
    def user_disorder_params
      params.require(:user_disorder).permit(:narrative, :user_id, :disorder_id, disorder_attributes: [:id, :narrative])
    end
end
