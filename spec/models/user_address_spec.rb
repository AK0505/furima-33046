require 'rails_helper'

RSpec.describe UserAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @user_address = FactoryBot.build(:user_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品を購入できるとき' do
      it '全て入力されていたら商品を購入できる'do 
        expect(@user_address).to be_valid
      end
      it 'building_name（建物の名前）が空でも商品を購入できる'do 
        @user_address.building_name =nil
        expect(@user_address).to be_valid
      end
    end

    context '商品が購入できない時' do
      it 'tokenが空の時' do
        @user_address.token = nil
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空の時' do
        @user_address.user_id = nil
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空の時' do
        @user_address.item_id = nil
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'postal_code(郵便番号)が空の時' do
        @user_address.postal_code = nil
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_code(郵便番号)にハイフンが入っていない時' do
        @user_address.postal_code = "2222222"
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'prefecture_id（都道府県）が選択されていない時(0が選ばれた時)' do
        @user_address.prefecture_id = 0
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it 'municipality（市区町村）が空の時' do
        @user_address.municipality = nil
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'address(番地)が空の時' do
        @user_address.address = nil
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_number(電話番号)が空の時' do
        @user_address.phone_number = nil
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_number(電話番号)が正しく入力されていない時' do
        @user_address.phone_number = "1234"
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_number(電話番号)が半角数字で入力されていない時' do
        @user_address.phone_number = "１１１１１１１１１１１"
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_number(電話番号)が半角数字以外が含まれた時' do
        @user_address.phone_number = "123-456789"
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_number(電話番号)が半角数字11桁以上入力された時' do
        @user_address.phone_number = "123456789123"
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("Phone number is invalid")
      end
    end

  end

end
