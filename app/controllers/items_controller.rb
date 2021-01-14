class ItemsController < ApplicationController
  before_action :authenticate_user!,  except: [:index]

    def index 
      # @items = Item.all
    end

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
    params.require(:item).permit(:name, :text, :price, :image, :prefecture_id, :day_id, :status_id, :judgement_id, :category_id).merge(user_id: current_user.id)
  end
  
end
