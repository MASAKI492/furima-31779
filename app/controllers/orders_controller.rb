class OrdersController < ApplicationController

  def index
     @item = Item.find(params[:item_id])
     @address_order = AddressOrder.new
  end

  def new

  end

  def create
    @address_order = AddressOrder.new(order_params)
    if @address_order.valid?
       @address_order.save
       redirect_to root_path
    else
       @item = Item.find(params[:item_id])
       render action: :index
    end
  end

  private

  def order_params
    params.require(:address_order).permit( :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end 


  
end











