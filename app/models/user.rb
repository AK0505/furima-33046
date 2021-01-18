class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
         has_many :contract_historys,dependent: :destroy
         
         with_options presence: true do
          validates :nickname
          validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
          # パスワードは半角英小文字・数字それぞれ１文字以上含むでないと登録できない

          validates :password
          # パスワード確認用

          validates :first_name,format: { with: /\A[ぁ-んァ-ン一-龥]/  }
          # 全角ひらがな、全角カタカナ、漢字

          validates :last_name,format: {with: /\A[ぁ-んァ-ン一-龥]/  }
          # 全角ひらがな、全角カタカナ、漢字

          validates :first_name_kana,format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/ }
          #  全角カタカナ

          validates :last_name_kana, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/ }
            #  全角カタカナ

          validates :birthday
         end
end
