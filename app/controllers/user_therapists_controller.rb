class UserTherapistsController < ApplicationController
  def new
    @user = current_user
    @user_therapist = @user.user_therapists.build
  end

  def create
    @user_therapist = current_user.user_therapists.new(user_therapist_params)
    if @user_therapist.save
      redirect_to user_user_therapists_path
    else
      render :new
    end
  end

  def index
    @user_therapists = UserTherapist.location
  end


  private

  def user_therapist_params
    params.require(:user_therapist).permit(:name, :location, :phone_number, :user_id)
  end
 end
