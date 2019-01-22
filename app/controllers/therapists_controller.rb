class TherapistsController < ApplicationController
  def new
    @therapist = Therapist.new
  end

  def create
    @therapist = Therapist.new(therapist_params)
    if @therapist.save
      redirect_to therapists_path
    else
      render :new
    end
  end

  def index
    @therapists = Therapist.all
  end

  def edit
  end

  private

  def therapist_params
    params.require(:therapist).permit(:name, :location, :phone_number)
  end
 end
