class UserTherapistsController < ApplicationController
  def new
    @user_therapist = UserTherapist.new
    # @user_therapist.build(user_id: current_user)
  end

  # def new
  #  if params[:user_therapist_id] && !UserTherapist.exists?(params[:user_therapist_id])
  #    redirect_to user_therapists_path, alert: "Therapist not found."
  #  else
  #    @user_therapist= UserTherapist.new(user_therapist_id: params[:user_therapist_id])
  #  end
  # end


  def create
    @user_therapist = current_user.user_therapists.new(user_therapist_params)
    # @user_therapist = UserTherapist.new(user_therapist_params)
    if @user_therapist.save
      redirect_to user_user_therapist_path(current_user, @user_therapist)
    else
      render :new
    end
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
