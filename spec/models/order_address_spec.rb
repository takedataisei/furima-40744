require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  describe '商品購入情報の保存' do
    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'tokenが空では保存できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空では保存できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが3桁ハイフン4桁の半角数字以外では保存できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'prefecture_idが1では保存できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'address_lineが空では保存できない' do
        @order_address.address_line = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address line can't be blank")
      end
      it 'tel_numberが空では保存できない' do
        @order_address.tel_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_numberが9桁以下では保存できない' do
        @order_address.tel_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel number is too short (minimum is 10 characters)')
      end
      it 'tel_numberが12桁以上では保存できない' do
        @order_address.tel_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel number is too long (maximum is 11 characters)')
      end
      it 'tel_numberが半角数値以外では保存できない' do
        @order_address.tel_number = '１２３４５６７８９０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel number Input only number')
      end
      it 'userが紐づいていないと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
