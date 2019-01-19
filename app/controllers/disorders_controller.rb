require 'pry'
class DisordersController < ApplicationController
  def index
    @disorders = Disorder.limit(3)
  end

  def new
    @disorder = Disorder.new
    @disorder.user_disorders.build
  end

  def create
    @disorder = Disorder.create(disorder_params)
     if @disorder.save
       redirect_to disorder_path(@disorder)
     else
       render :new
     end
  end

  def edit
    @disorder = Disorder.find_by(id: params[:id])

  end

  def update
  end

  def show
    @disorder = Disorder.find_by(id: params[:id])
    @user_disorder = @disorder.user_disorders

  end


  def disorder_params
    params.require(:disorder).permit(:name, :description, user_disorder_attributes: [:user_disorder_ids, :narrative])
  end
end
