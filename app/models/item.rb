class Item < ApplicationRecord
  has_many :basket_items, dependent: :destroy
  has_many :baskets, through: :basket_items
end
