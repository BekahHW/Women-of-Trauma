class UserTherapistsController < ApplicationController
  def new
    @user_therapist = UserTherapist.new
  end

  def create
    @user_therapist = current_user.user_therapists.new(user_therapist_params)
    if @user_therapist.save
      redirect_to user_user_therapist_path(current_user, @user_therapist)
    else
      render :new
    end
  end

    def update
      @user_therapist = UserTherapist.find(params[:id])
      @user_therapist.update(user_therapist_params)

      redirect_to user_user_therapist_path(current_user, @user_therapist)
    end

    def edit
      @user_therapist = UserTherapist.find(params[:id])
    end


  def show
    @user_therapist = UserTherapist.find_by(id: params[:id])
  end

  def index
    @user_therapists = UserTherapist.location
  end

  private

  def user_therapist_params
    params.require(:user_therapist).permit(:name, :location, :user_id)
  end
 end
