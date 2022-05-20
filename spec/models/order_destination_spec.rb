require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '購入情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order_destination).to be_valid
      end
      it 'buildingは空でも購入できること' do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'postcodeが空では購入できない' do
        @order_destination.postcode = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが空では購入できない' do
        @order_destination.prefecture_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では購入できない' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空では購入できない' do
        @order_destination.block = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it 'postcodeは半角のハイフンを含んだ正しい形式でないと購入できない' do
        @order_destination.postcode = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'userが紐付いてないと購入できない' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いてないと購入できない' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では購入できないこと' do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
      it 'phone_numberが9桁以下では購入できない' do
        @order_destination.phone_number = '123456789'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上では購入できない' do
        @order_destination.phone_number = '123456789876'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberに半角数字以外が含まれている場合は購入できない' do
        @order_destination.phone_number = '１２３４５６７８９１０'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
