class AddressController < ApplicationController
  def index
    @item = Item.find(params[:id])
  end

  def new
    
    @user_address = UserAddress.new
  end

  def create
    @user_address = UserAddress.new(address_params)
    if @user_address.valid? 
       @user_address.save
      redirect_to :index
    else
      render :index
    end
  end

  private

    def address_params 
      params.permit(:municipality, :postal_code, :address, :phone_number, :prefecture_id, :building_name, :item_id, :price).merge(user_id: current_user[:id])
    end
end
