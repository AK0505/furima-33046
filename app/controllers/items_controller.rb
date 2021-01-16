class ItemsController < ApplicationController
  before_action :authenticate_user!,  except: [:index, :show]
  before_action :set_item,  only: [:edit, :show, :update, :destroy]

    def index 
      @items = Item.all.order("created_at DESC")
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

  def show
  end

  def edit
    if @item.user != current_user
      redirect_to root_path
    end
  end


  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy 
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  private

  def item_params 
    params.require(:item).permit(:name, :text, :price, :image, :prefecture_id, :day_id, :status_id, :judgement_id, :category_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end
