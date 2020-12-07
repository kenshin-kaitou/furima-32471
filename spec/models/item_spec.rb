require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'nameとimageとinformationとcategory_idとstate_idとshipping_burden_idとshipper_prefecture_idとshipping_days_idとpriceが存在していれば保存できること' do
        expect(@item).to be_valid
      end

      it 'category_idが1以外の値であれば出品できること' do
        @item.category_id = 2
        expect(@item).to be_valid
      end

      it 'state_idが1以外の値であれば出品できること' do
        @item.state_id = 2
        expect(@item).to be_valid
      end

      it 'shipping_burden_idが1以外の値であれば出品できること' do
        @item.shipping_burden_id = 2
        expect(@item).to be_valid
      end

      it 'shipper_prefecture_idが1以外の値であれば出品できること' do
        @item.shipper_prefecture_id = 2
        expect(@item).to be_valid
      end

      it 'shipping_days_idが1以外の値であれば出品できること' do
        @item.shipping_days_id = 2
        expect(@item).to be_valid
      end

      it 'priceの値が300以上かつ9,999,999以下であれば出品できること' do
        @item.price = 1000
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it 'nameが空では出品できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Nameを入力してください')
      end

      it 'imageが空では出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Imageを入力してください')
      end

      it 'informationが空では出品できないこと' do
        @item.information = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Informationを入力してください')
      end

      it 'category_idが1では出品できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Categoryは1以外の値にしてください')
      end

      it 'state_idが1では出品できないこと' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Stateは1以外の値にしてください')
      end

      it 'shipping_burden_idが1では出品できないこと' do
        @item.shipping_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping burdenは1以外の値にしてください')
      end

      it 'shipper_prefecture_idが1では出品できないこと' do
        @item.shipper_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipper prefectureは1以外の値にしてください')
      end

      it 'shipping_days_idが1では出品できないこと' do
        @item.shipping_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping daysは1以外の値にしてください')
      end

      it 'priceが空では出品できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Priceを入力してください')
      end

      it 'priceが半角数字でなければ出品できないこと' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include('Priceは半角数字で入力してください')
      end

      it 'priceの値が300未満では出品できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Priceは300以上の値にしてください')
      end

      it 'priceの値が9,999,999より大きい場合出品できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Priceは9999999以下の値にしてください')
      end

      it 'userが紐付いていないと出品できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
