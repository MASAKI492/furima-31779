require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  describe '購入先住所' do
    before do
      @address_order = FactoryBot.build(:address_order)
    end

    context '購入情報がうまくいくとき' do
      it 'postal_code,prefecture_id,city,addresses,phone_numberすべての値が正しく入力されていれば保存できること' do
        expect(@address_order).to be_valid
      end
    end

    context '購入情報がうまくいかないとき' do
      it 'postal_codeが空だと登録できない' do
        @address_order.postal_code = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @address_order.postal_code = '1234567'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @address_order.prefecture_id = 1
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空だと登録できない' do
        @address_order.city = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空だと登録できない' do
        @address_order.addresses = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @address_order.phone_number = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁以上だと登録できない' do
        @address_order.phone_number = '090123456789'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空だと登録できない' do
        @address_order.token = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  














  end
end
