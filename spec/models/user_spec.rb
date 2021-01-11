require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
          it "全ての項目の入力が存在すれば登録できること" do
            @user = FactoryBot.build(:user)
            expect(@user).to be_valid
          end


          it "nicknameがない場合は登録できないこと" do 
            @user.nickname = ""
            @user.valid? 
            expect(@user.errors.full_messages).to include("Nickname can't be blank") 
          end

          it "emailがない場合は登録できないこと" do
            @user.email = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("Email can't be blank")
          end

          it "passwordがない場合は登録できないこと" do
            @user.password = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("Password can't be blank",
              "Password is invalid","Password confirmation doesn't match Password")
          end

          it "password_confirmationがない場合は登録できないこと" do
            @user.password_confirmation = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password confirmation doesn't match Password")
          end

          it "last_nameがない場合は登録できないこと" do
            @user.last_name = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
          end

          it "last_name_kanaがない場合は登録できないこと" do
            @user.last_name_kana = ""
            @user.valid?

            
            expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
          end

          it "first_nameがない場合は登録できないこと" do
            @user.first_name = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
          end

          it "first_name_kanaがない場合は登録できないこと" do
            @user.first_name_kana = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
          end

          it "birthdayがない場合は登録できないこと" do
            @user.birthday = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("Birthday can't be blank")
          end
end