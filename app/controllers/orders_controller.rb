class OrdersController < ApplicationController


  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:image,:name,:info,:category_id,:sales_status_id,:shippings_tee_status_id,:prefecture_id,:scheduled_delivary_id,:price).merge(user_id: current_user.id)
  end

end