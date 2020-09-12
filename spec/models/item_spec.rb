require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end

  describe '出品商品新規登録' do
    context '新規登録がうまくいくとき' do
      it "imageとgoods、shipper_commentとcategory_id,condition_id,delivery_fee_idとorigin_area_id,shipment_date_idとpriceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "画像が選択されていなければ登録できない" do
        @item.image = nil
        @item.valid?          #バリデーションをかける
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "goodsが空では登録できない" do
        @item.goods = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Goods can't be blank")
      end
      it "shipper_commentが空では登録できない" do
        @item.shipper_comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipper comment can't be blank")
      end
      it "category_idが1(--)では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it "condition_idが1(--)では登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition Select")
      end
      it "delivery_fee_idが1(--)では登録できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee Select")
      end
      it "origin_area_idが1(--)では登録できない" do
        @item.origin_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Origin area Select")
      end
      it "shipment_date_idが1(--)では登録できない" do
        @item.shipment_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment date Select")
      end
      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300〜9999999の間でなければ登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end
end
