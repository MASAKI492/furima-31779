class ItemsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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
    params.require(:item).permit(:category_id, :image, :name, :info, :sales_status_id, :price, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id).merge(user_id: current_user.id)
  end
end