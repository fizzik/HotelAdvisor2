class HotelsController < ApplicationController
  before_filter :signed_in_user,  only: [:create, :destroy, :new]
  before_filter :if_current_user_hotel,   only: :destroy


  def show
    unless @hotel = Hotel.where(id: params[:id]).first
      redirect_to current_user
      flash[:error] = "Page not found!"
    end
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = current_user.hotel.build(params[:hotel])
    if @hotel.save
      flash[:success] = "Hotel created!"
      redirect_to @hotel
    else
      render 'new'
      flash[:error] = "Error, try again!"
    end
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:id])
    if @hotel.update_attributes(params[:hotel])
      flash[:success] = "Hotel updated"
      redirect_to @hotel
    else
      render 'edit'
      flash[:error] = 'Error, try again!'
    end
  end


  def destroy
    @hotel.destroy
    redirect_to :back
  end

  def rate
    @hotel = Hotel.find(params[:id])
    @hotel.rate(current_user, params[:vote].to_i)
    respond_to do |format|
      format.js {
        render :text => @hotel.average_rating.to_s
      }
    end
  end

  private

  def if_current_user_hotel
    @hotel = current_user.hotel.find_by_id(params[:id])
    redirect_to :back if @hotel.nil?
  end


end