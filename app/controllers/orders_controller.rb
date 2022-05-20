class OrdersController < ApplicationController
  before_action :item_set
  def index
    @order_destination = OrderDestination.new
    if !user_signed_in?
     redirect_to new_user_session_path  
    elsif current_user == @item.user || @item.order.present?
     redirect_to root_path
    end
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      pay_item
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def item_set
    @item = Item.find(params[:item_id])
  end
end
