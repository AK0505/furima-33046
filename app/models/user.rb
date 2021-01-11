class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         

         validates :nickname, presence: true

         


         validates :password, presence: true,
          format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
         # パスワードは半角英小文字・数字それぞれ１文字以上含むでないと登録できない

         validates :password, confirmation: true
         # パスワード確認用

         validates :first_name, presence: true,
          format: { with: /\A[ぁ-んァ-ン一-龥]/  }
         # 全角ひらがな、全角カタカナ、漢字

         validates :last_name, presence: true,
         format: {with: /\A[ぁ-んァ-ン一-龥]/  }
         # 全角ひらがな、全角カタカナ、漢字

         validates :first_name_kana, presence: true,
         format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/ }
         #  全角カタカナ

         validates :last_name_kana, presence: true,
          format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/ }
          #  全角カタカナ

         validates :birthday, presence: true
end
