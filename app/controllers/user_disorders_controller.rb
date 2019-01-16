class UserDisordersController < ApplicationController
  def index
    @user_disorders = UserDisorder.limit(10)
  end

  def new
    @user_disorder = UserDisorder.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

end
