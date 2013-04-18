class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address.hotel_id = params[:hotel_id]
    if @address.save
      flash[:success] = "Address added"
      redirect_to page_path
    else
      render 'new'
      flash[:error] = "Error, try again!"
    end
  end
end