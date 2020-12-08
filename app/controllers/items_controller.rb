class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_parameter)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user != current_user
      redirect_to root_path
    end
  end

  def update
    if @item = Item.update(items_parameter)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end
  private

  def items_parameter
    params.require(:item).permit(:name, :information, :price, :state_id, :category_id, :shipping_burden_id, :shipper_prefecture_id, :shipping_days_id, :image).merge(user_id: current_user.id)
  end
end
