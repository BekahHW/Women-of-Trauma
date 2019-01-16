class UsersController < ApplicationController
    def index
      @users = User.limit(10)
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
       if @user.valid?
         @user.save
         redirect_to user_path(@user)
       else
         render :new
       end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      @user.update(params.require(:user))
      redirect_to user_path(@user)
    end

    def show
      @user = User.find(params[:id])
    end

  def destroy
  end

private
  def user_params
    params.require(:user).permit(:name, :location, :email, :password, :password_confirmation)
  end

end
