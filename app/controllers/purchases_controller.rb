class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @item = Item.find(params[:item_id])
    if @item.user == current_user
      redirect_to root_path
    end
    @purchase_shipping = PurchaseShipping.new

  end

  def create
    @item = Item.find(params[:item_id])
    purchase = Purchase.new
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      pay_item
      if @purchase_shipping.save
       redirect_to root_path
      end
    else
      
      render 'index'
    end
  end

  private
  
  def purchase_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture, :cities, :address, :building_name, :phone_number).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'                 
    )
  end
end
