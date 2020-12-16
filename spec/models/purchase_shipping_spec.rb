require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_shipping = FactoryBot.build(:purchase_shipping)
    @purchase_shipping.user_id = @user.id
    @purchase_shipping.item_id = @item.id
  end

  describe "商品購入" do

    context "商品購入がうまくいくとき" do

      it "tokenとpostal_codeとprefecture_idとcitiesとaddressとphone_numberとbuilding_nameが存在すれば購入できること" do
        expect(@purchase_shipping).to be_valid
      end

      it "building_nameが空でも購入できること" do
        @purchase_shipping.building_name = nil
        expect(@purchase_shipping).to be_valid
      end
    end

    context "商品購入がうまくいかないとき" do
      
      it "tokenが空では購入できないこと" do
        @purchase_shipping.token = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Tokenを入力してください") 
      end

      it "postal_codeが空では購入できないこと" do
        @purchase_shipping.postal_code = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal codeを入力してください")
      end

      it "postal_codeに「-」が含まれていないと購入できないこと" do
        @purchase_shipping.postal_code = "0123456"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal codeを正しく入力してください")
      end
      
      it "prefectureが空では購入できないこと"do
        @purchase_shipping.prefecture = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefectureを入力してください")
      end

      it "prefectureが1では購入できないこと" do
        @purchase_shipping.prefecture = 1
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefectureは1以外の値にしてください")
      end

      it "citiesが空では購入できないこと" do
        @purchase_shipping.cities = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Citiesを入力してください")
      end

      it "addressが空では購入できないこと" do
        @purchase_shipping.address = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Addressを入力してください")
      end

      it "phone_numberが空では購入できないこと" do
        @purchase_shipping.phone_number = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone numberを入力してください")
      end

      it "phone_numberが数値でないと購入できないこと" do
        @purchase_shipping.phone_number = "１１１１１１１１１１１"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone numberは数値で入力してください")
      end

      it "userが紐付いていなければ購入できないこと" do
        @purchase_shipping.user_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Userを入力してください")
      end

      it "itemが紐付いていなければ購入できないこと" do
        @purchase_shipping.item_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Itemを入力してください")
      end
    end

  end

end
