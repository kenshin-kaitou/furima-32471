class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
    @shipping = Shipping.new
  end

  private

  
end
