class Item < ApplicationRecord
    belongs_to :genre
    attachment :item_image
    has_many :order_items, dependent: :destroy
    has_many :cart_items, dependent: :destroy
end
