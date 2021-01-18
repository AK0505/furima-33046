class Address < ApplicationRecord

  with_options presence: true do
    
    validates :municipality
    validates :postal_code
    validates :address
    validates :phone_number
    validates :contract_history
    
  end
  
  validates :building_name
  validates :prefecture_id,      numericality: { other_than: 0 }
end
