class AddressController < ApplicationController
    before_action :authenticate_user!
    before_action :set_item, only: [:index,:create]

  def index
    @user_address = UserAddress.new
    if  @item.contract_history != nil  || current_user == @item.user  
       redirect_to root_path
    end
  end

  def new
    @user_address = UserAddress.new
  end

  def create
    @user_address = UserAddress.new(address_params)
    if @user_address.valid?
      pay_item
       @user_address.save
      redirect_to  root_path
    else
      render :index
    end
    
  end

  private

    def address_params 
      params.permit(:municipality, :postal_code, :address, :phone_number, :prefecture_id, :building_name,:item_id,:token).merge(user_id: current_user.id)
    end


    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: address_params[:token],
        currency: 'jpy'
      )
    end

    def set_item
      @item = Item.find(params[:item_id])
    end
end
