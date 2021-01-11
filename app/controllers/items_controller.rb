class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.includes(:user).order("updated_at DESC").limit(4)
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
   if @item.user == current_user
    render "edit"
   else
    redirect_to item_path
   end
  end

  def update
   if @item.update(item_params)
    redirect_to item_path
   else
    render :new
   end
  end

  private
  def item_params
    params.require(:item).permit(:image,:name,:info,:category_id,:sales_status_id,:shippings_tee_status_id,:prefecture_id,:scheduled_delivary_id,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end