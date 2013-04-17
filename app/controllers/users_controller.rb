class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :if_user_current,   only: [:edit, :update]

  def show
    unless @user = User.where(id: params[:id]).first
    redirect_to current_user
    flash[:error] = "Page not found!"
    end
    @hotels = @user.hotel.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome!"
      redirect_back_or @user
    else
      render 'new'
      flash[:error] = "Error, try again!"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
      flash[:error] = 'Error, try again!'
    end
  end

  private

  def if_user_current
    @user = User.find(params[:id])
    redirect_to(current_user) unless current_user?(@user)
  end
end
