require 'rails_helper'

RSpec.describe Order, type: :model do

  
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
  end

  describe '購入情報登録' do
    context '内容に問題がある場合' do
      it '必要事項を全て過不足なく入力すると登録できる' do
        expect(@order).to be_valid
      end
    end
    context '内容に問題がない場合' do
      it 'postcodeが空では登録できない' do
        @order.postcode = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postcode can't be blank")
      end

      it '郵便番号が半角ハイフンを含む形でなければ購入できない' do
        @order.postcode = '1234567' # ハイフンを含まない郵便番号
        @order.valid?
        expect(@order.errors.full_messages).to include("Postcode is invalid") # 適切なエラーメッセージに書き換えてください
      end

      it '発送元の地域が空では登録できない' do
        @order.shipping_region_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Shipping region can't be blank")
      end

      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @order.shipping_region_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Shipping region can't be blank")
      end

      it '市区町村が空では登録できない' do
        @order.municipalities = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipalities can't be blank")
      end

      it '住所が空では登録できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it '建物名が空でも登録できる' do
        @order.building_name = ''
        expect(@order).to be_valid
      end

      it '電話番号が空では登録できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号に半角数字以外が含まれている場合は出品できない' do
        @order.phone_number = 'ﾔﾏﾀﾞ'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is not a number')
      end
      
      it '電話番号が9桁以下では購入できない' do
        @order.phone_number = '123456789' # 9桁の電話番号
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end

      it '電話番号が12桁以上では購入できない' do
        @order.phone_number = '1234567890123' # 12桁以上の電話番号
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it 'userが紐付いていなければ出品できない' do
        @order.user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('User must exist')
      end

      it 'itemが紐付いていなければ出品できない' do
        @order.item = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Item must exist')
      end

    end
  end
end


