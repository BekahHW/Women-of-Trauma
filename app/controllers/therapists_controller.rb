class TherapistsController < ApplicationController
  def new
    @therapist = Therapist.new
  end

  def create
    @therapist = Therapist.find_or_create_by(therapist_params)
    # @therapist = Therapist.new(therapist_params)
    if @therapist.save
      redirect_to therapists_path
    else
      render :new
    end
  end

  def index
    @therapists = Therapist.all
    respond_to do |format|
        format.html { render :index}
        format.json { render json: @therapists}
    end
  end

  def edit
  end

  private

  def therapist_params
    params.require(:therapist).permit(:name, :location, :phone_number)
  end
 end
