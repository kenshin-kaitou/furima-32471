class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @purchase_shipping = PurchaseShipping.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.user == current_user || !@item.purchase.nil?
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      pay_item
      redirect_to root_path if @purchase_shipping.save
    else
      @purchase_shipping.postal_code = ''
      @purchase_shipping.prefecture = ''
      @purchase_shipping.cities = ''
      @purchase_shipping.address = ''
      @purchase_shipping.building_name = ''
      @purchase_shipping.phone_number = ''
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
end
