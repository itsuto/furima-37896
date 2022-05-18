class OdersController < ApplicationController

  def index
  end

  def new
    @order_destination = OrderDestination.new
  end
  
  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def order_params
    params.require(:order_destination).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id)
end
