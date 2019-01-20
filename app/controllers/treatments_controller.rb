class TreatmentsController < ApplicationController
  def index
    @treatments = Treatment.all
  end

  def new
    @treatment = Treatment.new
  end

  def create
    @treatment = Treatment.create(treatment_params)
    if @treatment.save
      redirect_to treatment_path(@treatment)
    else
      render :new
    end
  end

  def update
    @treatment = Treatment.find(params[:id])
    @treatment.update(treatment_params)

    redirect_to treatment_path(@treatment)
  end

  def edit
    @treatment = Treatment.find(params[:id])
  end

  def show
    @treatment = Treatment.find_by(id: params[:id])
  end

  private
   def treatment_params
     params.require(:treatment).permit(:med_name, :med_dosage, :therapy_name, :comments)
   end

end
