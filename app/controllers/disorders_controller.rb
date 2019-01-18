class DisordersController < ApplicationController
  def index
    @disorders = Disorder.limit(3)
  end

  def new
    @disorder = Disorder.new
    @disorder.user_disorders.build
  end

  def create
    @disorder = Disorder.new(disorder_params)
     if @disorder.save
       redirect_to disorder_path(@disorder)
     else

       render :new
     end
  end

  def edit
  end

  def update
  end

  def show
    @disorder = Disorder.find_by(id: params[:id])
  end

  def disorder_params
    params.require(:disorder).permit(:name, :description, user_disorders_attributes: [:narrative])
  end
end
