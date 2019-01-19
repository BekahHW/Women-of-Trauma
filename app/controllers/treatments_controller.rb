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
      redirect_to 'treatments_path(@treatment)'
    else
      render :new
    end
  end 

  def update
  end

  def edit
  end

  def show
  end

  private
   def treatment_params
     params.require(:treatment).permit(:med_name, :med_dosage, :therapies, :comments)
   end

end
