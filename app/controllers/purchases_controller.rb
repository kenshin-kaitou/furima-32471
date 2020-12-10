class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
    @shipping = Shipping.new
  end

  def create
    @purchase = Purchase.new(purchases_params)
    if @purchase.valid?
      pay_item
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
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      card: order_params[:token],  
      currency: 'jpy'                 
    )
  end
end
