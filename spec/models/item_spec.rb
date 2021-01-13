require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  it '全て正確に入力されていれば商品は登録することができる'do
  # @user = FactoryBot.build(:user)
  # expect(@user).to be_valid

  end

end
