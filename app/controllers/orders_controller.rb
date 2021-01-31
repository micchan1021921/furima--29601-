class OrdersController < ApplicationController
before_action :set_item, only: [:index, :create]
before_action :sold_out_item, only: [:index]
before_action :move_to_signed_in, only: [:index]

def index
  @order_address = OrderAddress.new
     if current_user == @item.user
      redirect_to root_path
     end
end

def create
  @order_address = OrderAddress.new(address_params)
  if @order_address.valid?
    pay_item
     @order_address.save
      redirect_to root_path
     else
      render :index
  end
end


private
def address_params
  params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
end

def set_item
  @item = Item.find(params[:item_id])
end

def sold_out_item
  redirect_to root_path if @item.order.present?
end

def move_to_signed_in
  unless user_signed_in?
    redirect_to  user_session_path
  end
end

def pay_item
  Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]  
  Payjp::Charge.create(
    amount: @item.price ,
    card: address_params[:token], 
    currency: 'jpy' 
  )
end

end
