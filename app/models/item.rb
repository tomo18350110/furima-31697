class Item < ApplicationRecord
  #has_many   :comments
  #has_one    :purchase
  belongs_to :user
  has_one_attached :image
  
end
