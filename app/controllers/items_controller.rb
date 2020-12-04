class ItemsController < ApplicationController
  def index

  end

  def new
    
  end

  def create
    
  end

  private
  def items_parameter
    params.require(:item).permit(:name, :information, :price, :state_id, :category_id, :shipping_burden_id, :shipper_prefecture_id, :shipping_days).merge(user_id: current_user.id)
  end
end
