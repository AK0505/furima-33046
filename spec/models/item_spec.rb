require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品登録' do
    # 正常系
    context '商品を登録できるとき' do
      it '全て正確に入力されていれば商品は登録することができる'do
        @item = FactoryBot.build(:item)
        expect(@item).to be_valid
      end
    end


      #異常系
    context '商品が登録できないとき' do
      it 'イメージを入力されていなければ登録できない'do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品の名前が入力されていなければ登録できない'do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が入力されていなければ登録できない'do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it 'カテゴリーが選択されていなければ登録できない'do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end

      it '商品の状態が選択されていなければ登録できない'do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 0")
      end

      it '配送料の負担が選択されていなければ登録できない'do
        @item.judgement_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Judgement must be other than 0")
      end

      it '発送先の地域が選択されていなければ登録できない'do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it '発送までの日数が選択されていなければ登録できない'do
        @item.day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 0")
      end

      it '販売価格が入力されていなければ登録できない'do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格のの入力が半角数字でなければ登録できない'do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '販売価格が300円以下なら登録できない'do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '販売価格が9999999以上なら登録できない'do
        @item.price = 99999999
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end

  
  

end
