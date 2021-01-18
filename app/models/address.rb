class Address < ApplicationRecord

  with_options presence: true do
    
    validates :municipality #市区町村
    validates :postal_code #郵便番号
    validates :address #住所
    validates :phone_number #電話番号
    
  end
  
  validates :prefecture_id,      numericality: { other_than: 0 }
end
