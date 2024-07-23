require 'rails_helper'

RSpec.describe OrderShared, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user.id)
    @order_shared = FactoryBot.build(:order_shared, user_id: @user.id, item_id: @item.id)
  end

  describe '購入情報登録' do
    context '内容に問題がない場合' do
      it '必要事項を全て過不足なく入力すると登録できる' do
          expect(@order_shared).to be_valid
      end

      it '建物名が空でも登録できる' do
        @order_shared.building_name = ''
        expect(@order_shared).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'postcodeが空では登録できない' do
        @order_shared.postcode = ''
        @order_shared.valid?
        expect( @order_shared.errors.full_messages).to include("Postcode can't be blank")
      end

      it '郵便番号が半角ハイフンを含む形でなければ購入できない' do
        @order_shared.postcode = '1234567'
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end

      it '発送元の地域が空では登録できない' do
        @order_shared.shipping_region_id = ''
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Shipping region can't be blank")
      end

      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @order_shared.shipping_region_id = 1
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Shipping region can't be blank")
      end

      it '市区町村が空では登録できない' do
        @order_shared.municipalities = ''
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Municipalities can't be blank")
      end

      it '住所が空では登録できない' do
        @order_shared.address = ''
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では登録できない' do
        @order_shared.phone_number = ''
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号に半角数字以外が含まれている場合は出品できない' do
        @order_shared.phone_number = 'ﾔﾏﾀﾞ'
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Phone number is invalid")
      end
      
      it '電話番号が9桁以下では購入できない' do
        @order_shared.phone_number = '123456789'
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が12桁以上では購入できない' do
        @order_shared.phone_number = '1234567890123'
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Phone number is invalid")
      end

      it 'userが紐付いていなければ出品できない' do
        @order_shared.user_id = nil
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include('User can\'t be blank')
      end
    
      it 'itemが紐付いていなければ出品できない' do
        @order_shared.item_id = nil
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include('Item can\'t be blank')
      end
    end
  end
end
