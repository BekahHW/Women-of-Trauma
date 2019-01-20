require 'pry'
class DisordersController < ApplicationController
  def index
    @disorders = Disorder.limit(3)
  end

  def new
    @disorder = current_user.disorders.build
    # @disorder = Disorder.new
    @user_disorder = @disorder.user_disorders.build
  end

  def create
    @disorder = current_user.disorders.build(disorder_params)
    @disorder.user_disorders.last.user_id=current_user.id
     if @disorder.save
       # binding.pry
       redirect_to disorder_path(@disorder)
     else
       render :new
     end
  end

  def edit
    @disorder = Disorder.find(params[:id])
  end

  def update
    @disorder = Disorder.find(params[:id])
    @disorder.update(disorder_params)
    redirect_to disorder_path(@disorder)
  end

  def show
    @disorder = Disorder.find(params[:id])
    @user_disorder = @disorder.user_disorders.where(user_id:current_user.id).first
  end

private
  def disorder_params
    params.require(:disorder).permit(:name, :description, user_disorders_attributes: [:id, :narrative, :user_id])
  end
end
