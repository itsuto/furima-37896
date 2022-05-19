class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new
    if current_user == @item.user || @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid? 
      @order_destination.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
