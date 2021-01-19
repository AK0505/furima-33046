class UserAddress
  include ActiveModel::Model
  attr_accessor :municipality, :postal_code, :address, :phone_number, :prefecture_id, :building_name,:contract_history_id, :user_id, :item_id


  with_options presence: true do
    
    validates :municipality #市区町村
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }#郵便番号
    validates :address #住所
    validates :phone_number #電話番号
    
  end
  
  validates :prefecture_id,      numericality: { other_than: 0 }

  def save
    contract_history = ContractHistory.create(user_id: user_id, item_id: item_id)
    Address.create(municipality: municipality, 
                   postal_code: postal_code, 
                   address: address,
                   phone_number: phone_number, 
                   prefecture_id: prefecture_id, 
                   building_name: building_name,
                   contract_history_id: contract_history_id
      )
  end

end