class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
  validates :item_name
  validates :explanation
  validates :image
  end

  with_options presence: true, numericality: { other_than: 1 } do
  validates :category_id
  validates :condition_id
  validates :shipping_charges_id
  validates :shipping_area_id
  validates :days_to_ship_id
  end
  

  validates :item_price,          presence: true, format: { with: /\A[0-9]+\z/ }, inclusion: { in: 300..9999999 }
  validates :category_id, numericality: { other_than: 1 }
  #has_many   :comments
  #has_one    :purchase
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :shipping_area
  belongs_to :shipping_charge
  
end
