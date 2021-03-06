class ItemsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create,:edit,:update]
  before_action :set_item, only: [:edit,:show,:update,:destroy]

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

  def show
  end

  def edit
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
  
  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path
    else
      render 'edit' 
    end
  end

  def destroy
    if current_user.id == @item.user_id
   @item.destroy
   redirect_to root_path
   else
    redirect_to action: :show
   end
   
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :image, :name, :info, :sales_status_id, :price, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id).merge(user_id: current_user.id)
  end
end
