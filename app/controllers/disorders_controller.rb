class DisordersController < ApplicationController
  def index
    @disorders = Disorder.all
    respond_to do |format|
        format.html { render :index}
        format.json { render json: @disorders, include: 'user_disorder, user, user_disorder.user_id' }
      end
  end


  def new
    # @disorder = Disorder.new
    @disorder = Disorder.all
    # @disorder.user_disorders.build(user_id: current_user)
  end

  def create
    # @disorder = Disorder.new(disorder_params)
    @disorder = Disorder.all

     if @disorder.save
       redirect_to disorder_path(@disorder)
     else
       render :new
     end
  end

  def edit
    @disorder = Disorder.find(params[:id])
    if !@disorder.user_ids.first == current_user.id
    redirect_to users_welcome_path
  end
end

  def update
    @disorder = Disorder.find(params[:id])
    @disorder.update(disorder_params)
    redirect_to disorder_path(@disorder)
  end

  def show
    @disorder = Disorder.find(params[:id])
    @user_disorder = @disorder.user_disorders.where(user_id:current_user.id).all

    respond_to do |format|
      format.html { render :show}
      format.json { render json: @disorders }
      # format.json { render :json => {:disorder => @disorder,
      #                        :user_disorder => @user_disorder}}
    end
  end

private
  def disorder_params
    params.require(:disorder).permit(:name, :description, user_disorders_attributes: [:id, :narrative, :user_id])
  end
end
