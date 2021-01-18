class AddressController < ApplicationController
  def index
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to :index
    else
      render :index
    end
  end

  private

    def address_params 
      params.require(:address).permit(:municipality, :postal_code, :address, :phone_number, :prefecture_id)
    end
end
