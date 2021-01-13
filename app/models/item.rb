class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user 
  has_one_attached :image
  # has_many :contract_history
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day
  belongs_to_active_hash :status
  belongs_to_active_hash :judgement



  with_options presence: true do
    validates :text
    validates :price,     format: {with: /\A[0-9]+\z/ }
    validates :name
  end

  validates :prefecture_id,      numericality: { other_than: 0 }
  validates :day_id,             numericality: { other_than: 0 }
  validates :status_id,          numericality: { other_than: 0 }
  validates :judgement_id,       numericality: { other_than: 0 }
end
