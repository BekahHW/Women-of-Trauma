class TherapistsController < ApplicationController
  def new
    @therapist = Therapist.new
    respond_to do |format|
        format.html { render :new}
        format.json { render json: @therapist}
    end
  end

  def create
    @therapist = Therapist.find_or_create_by(therapist_params)
    # @therapist = Therapist.new(therapist_params)
    if @therapist.save
      # render 'therapists/new', :layout => false
      render json: @therapist, status: 201

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

  def show
    @therapist = Therapist.find(params[:id])
    respond_to do |format|
      format.html { render :show}
      format.json { render json: @therapist }
      # format.json { render :json => {:disorder => @disorder,
      #                        :user_disorder => @user_disorder}}
    end
  end


  private

  def therapist_params
    params.require(:therapist).permit(:name, :location, :phone_number)
  end
 end
