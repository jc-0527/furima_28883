require 'rails_helper'

RSpec.describe PurchaseInfo, type: :model do
  before do
    user = FactoryBot.build(:user)
    item = FactoryBot.build(:item)
    @purchase_info = FactoryBot.build(:purchase_info, user_id: user.id, item_id: item.id )
  end

  describe '購入機能' do
    context '購入がうまくいくとき' do
      it "postal_codeとprefectures、municiplitiesとaddress,building_name,phone_numberとpurchase_id,user_idとitem_idが存在すれば登録できる" do
        expect(@purchase_info).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it "postal_codeが空だと登録できない" do
        @purchase_info.postal_code = ''
        @purchase_info.valid?
        expect(@purchase_info.errors.full_messages).to include("Postal code can't be blank")
      end
      it "municipalitiesが空では登録できない" do
        @purchase_info.municipalities = ''
        @purchase_info.valid?
        expect(@purchase_info.errors.full_messages).to include("Municipalities can't be blank")
      end
      it "addressが空では登録できない" do
        @purchase_info.address = ''
        @purchase_info.valid?
        expect(@purchase_info.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空では登録できない" do
        @purchase_info.phone_number = ''
        @purchase_info.valid?
        expect(@purchase_info.errors.full_messages).to include("Phone number can't be blank")
      end
      it "tokenが空では登録できない" do
        @purchase_info.token = ''
        @purchase_info.valid?
        expect(@purchase_info.errors.full_messages).to include("Token can't be blank")
      end
      it "prefecturesが1(--)では登録できない" do
        @purchase_info.prefectures = 1
        @purchase_info.valid?
        expect(@purchase_info.errors.full_messages).to include("Prefectures Select")
      end
      it "postal_codeは○○○-○○○○の形式でなければ登録できない" do
        postal_codes = %w("1111111", "11111111", "1111-1111", "111-11111")
        postal_codes.each do | postal_code |
          @purchase_info.postal_code = postal_code
          @purchase_info.valid?
          expect(@purchase_info.errors.full_messages).to include("Postal code Input correctly")
        end
      end
      it "phone_numberは11桁の半角数字の形式でなければ登録できない" do
        phone_numbers = %w("1111-111111", "11111-111111", "aaaaaaaaaa1")
        phone_numbers.each do | phone_number |
          @purchase_info.phone_number = phone_number
          @purchase_info.valid?
          expect(@purchase_info.errors.full_messages).to include("Phone number must be half-width numbers")
        end
      end
    end
  end
end
