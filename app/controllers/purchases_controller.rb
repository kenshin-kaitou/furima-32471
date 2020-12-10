class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
    @shipping = Shipping.new
  end

  def create
    @purchase = Purchase.new(purchases_params)
    if @purchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  private
  def purchases_params
    params.require(:purchase).merge(token: params[:token], user_id: current_user_id, item_id: params[:item_id])
  end
  
end
