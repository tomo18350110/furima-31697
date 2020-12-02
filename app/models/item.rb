class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :item_name,           presence: true
  validates :explanation,         presence: true
  validates :category_id,         presence: true
  validates :condition_id,        presence: true
  validates :shipping_charges_id, presence: true
  validates :shipping_area_id,    presence: true
  validates :days_to_ship_id,     presence: true
  validates :item_price,          presence: true, format: { with: /\A[0-9]+\z/ }, inclusion: { in: 300..9999999 }
  validates :image,               presence: true

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
