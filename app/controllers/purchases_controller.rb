class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :get_item
  def index
    @purchase_shipping = PurchaseShipping.new
    redirect_to root_path if @item.user == current_user || !@item.purchase.nil?
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      pay_item
      redirect_to root_path if @purchase_shipping.save
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture, :cities, :address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def get_item
    @item = Item.find(params[:item_id])
  end
end
