class ItemsController < ApplicationController

  def new 
    @item = Item.new
  end

  def create 
    @item = Item.new(item_params)
    if @item.save 
        redirect_to root_path 
    else
      render :new
    end
  end 


  private

  def item_params 
    permit.require(:item).params(:name, :text, :price, :image, :prefecture_id, :day_id,:status_id,:judgement_id)
  end
  
end
