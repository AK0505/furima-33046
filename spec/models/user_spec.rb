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

          it "重複しているemailがある場合は登録できないこと" do
            @user.save
            @user2 = FactoryBot.build(:user)
            @user2.email = @user.email
            @user2.valid?
            expect(@user2.errors.full_messages).to include("Email has already been taken")
          end

          it "passwordがない場合は登録できないこと" do
            @user.password = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("Password can't be blank",
              "Password is invalid","Password confirmation doesn't match Password")
          end

          it "passwordは英語のみでは登録できないこと" do
            @user.password = "aaaaaa"
            @user.valid?
            expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
          end
          it "passwordは数字のみでは登録できないこと" do
            @user.password = "111111"
            @user.valid?
            expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
          end

          it "passwordは全角では登録できないこと" do
            @user.password = "ああああああ"
            @user.valid?
            expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
          end

          it "passwordは6文字以上でないと登録できないこと" do
            @user.password = "a1234"
            @user.valid?
            expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
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

          it "last_nameは漢字、ひらがな、カタカナ以外の場合は登録できないこと" do
            @user.last_name = "yamada"
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name is invalid")
          end

          it "last_name_kanaがない場合は登録できないこと" do
            @user.last_name_kana = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
          end

          it "last_name_kanaはカタカナ以外の場合は登録できないこと" do
            @user.last_name_kana = "山田"
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name kana is invalid")

            @user.last_name_kana = "tarou"
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name kana is invalid")

            @user.last_name_kana = "たろう"
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name kana is invalid")
          end

          it "first_nameがない場合は登録できないこと" do
            @user.first_name = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
          end

          it "first_nameは漢字、ひらがな、カタカナ以外の場合は登録できないこと" do
            @user.first_name = "yamada"
            @user.valid?
            expect(@user.errors.full_messages).to include("First name is invalid")
          end

          it "first_name_kanaがない場合は登録できないこと" do
            @user.first_name_kana = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
          end

          it "first_name_kanaはカタカナ以外の場合は登録できないこと" do
            @user.first_name_kana = "太郎"
            @user.valid?
            expect(@user.errors.full_messages).to include("First name kana is invalid")

            @user.first_name_kana = "tarou"
            @user.valid?
            expect(@user.errors.full_messages).to include("First name kana is invalid")

            @user.first_name_kana = "たろう"
            @user.valid?
            expect(@user.errors.full_messages).to include("First name kana is invalid")
          end

          it "birthdayがない場合は登録できないこと" do
            @user.birthday = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("Birthday can't be blank")
          end
end