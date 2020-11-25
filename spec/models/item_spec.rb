require 'rails_helper'

RSpec.describe Item, type: :model do
  before do  
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまく行くとき' do
      it 'image,user_id,name, info,category_id, sales_status_id, price, shipping_fee_status_id, prefecture_id, scheduled_delivery_idがあれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it '商品画像が空だと登録できない' do
        @item.image= nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説名が空だと登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it '商品カテゴリーが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank","Category is not a number")
      end
      
      it '商品の状態が空だと登録できない' do
        @item.sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status is not a number", "Sales status can't be blank")
      end
      it '商品配送料の負担が空だと登録できない' do
        @item.shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status is not a number", "Shipping fee status can't be blank")
      end
      it '発送元の地域についての情報が空だと登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number", "Prefecture can't be blank")
      end
      it '発送までの日数についての情報が空だと登録できない' do
        @item.scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery is not a number", "Scheduled delivery can't be blank")
      end
      it '商品価格についての情報が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '商品価格の範囲が、¥300~¥9,999,999の間でなければ登録できない' do
        @item.price = '¥300~¥9,999,999' 
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price is not included in the list")
      end
      it '商品販売価格が全角数字だと登録できない' do
        @item.price = '００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
     
    end
  end
end
