class UserTherapistsController < ApplicationController
  def new
    @user_therapist = current_user.user_therapists.new

  end

  def create
    @user_therapist = current_user.user_therapist.new(user_therapist_params)
    if @user_therapist.save
      redirect_to user_user_therapists_path
    else
      render :new
    end
  end

  def index
    @user_therapists = UserTherapist.all
  end

  private

  def user_therapist_params
    params.require(:therapist).permit(:name, :location, :phone_number, :therapist_id, :user_id)
  end
 end
