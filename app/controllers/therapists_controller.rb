class TherapistsController < ApplicationController
  def new
    @therapist = Therapist.new
  end

  def create
    @therapist = Therapist.build(therapist_params)
    if @therapist.save
      redirect_to user_therapists_path
    else
      render :new
    end
  end

  def index
    @treatments = Treatment.all
  end

  def edit
  end

  private

  def therapist_params
    params.require(:therapist).permit(:name, :location, :phone_number)
  end
 end
