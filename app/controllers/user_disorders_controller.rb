class UserDisordersController < ApplicationController
before_action :set_disorder

  def index
    # @user_disorders = UserDisorder.all
    @user_disorders = @disorder.user_disorder
    respond_to do |format|
        format.html { render 'index.html', :layout => false}
        format.json { render 'index.json', :layout => false }
      end

    # @user_disorder = @disorder.user_disorders
   #  if params[:disorder_id]
   #   @disorder = Disorder.find_by(id: params[:disorder_id])
   #   if @disorder.nil?
   #     redirect_to disorders_path, alert: "Disorder not found"
   #   else
   #     @user_disorders = @disorder.user_disorders
   #   end
   # else
   #   @user_disorders = UserDisorder.all
   # end
 end

  def new
    # @disorder = Disorder.new
    @user_disorder = UserDisorder.new
    # @user_disorder.disorder.create(user_id: current_user)
  end

  def create
    # @disorder = Disorder.new
    @user_disorder = current_user.user_disorders.new(user_disorder_params)
    @user_disorder.save
    # binding.pry

    respond_to do |format|
        format.html { render :new}
        format.json { render json: @user_disorders }
      end
     # if @user_disorder.save
     #   redirect_to disorder_user_disorders_path(@user_disorder.disorder)
     # else
     #   render :new
     # end
  end

  def show
    # if params[:disorder_id]
    #   @disorder = Disorder.find(params[:disorder_id])
    # @user_disorder = @disorder.user_disorders.find(params[:id])
    @user_disorder = UserDisorder.find(params[:id])
    if @user_disorder.nil?
      redirect_to disorder_user_disorders_path(@disorder), alert: "Disorder not found"
    end
  else
    @user_disorder = UserDisorder.find(params[:id])
    @user = @user_disorder.user
  end
# end


  private
    def set_disorder
      @disorder = Disorder.find(params[:disorder_id])
    end

    def user_disorder_params
      params.require(:user_disorder).permit(:narrative, :user_id, :disorder_id)
      # , disorder_attributes: [:narrative])
    end
end
