class OrdersController < ApplicationController
  before_action :move_to_index, except: [:index]
 
  def index
     @item = Item.find(params[:item_id])
     @address_order = AddressOrder.new
  end

  def new

  end

  def create
    @item = Item.find(params[:item_id])
    @address_order = AddressOrder.new(order_params)
    if @address_order.valid?
       pay_item
      @address_order.save
       redirect_to root_path
    else
       @item = Item.find(params[:item_id])
       render action: :index
    end
  end

  private

  def order_params
    params.require(:address_order).permit( :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end 

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token]  ,
        currency: 'jpy'                 
      )
    end
  
end











