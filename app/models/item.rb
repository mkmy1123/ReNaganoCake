class Item < ApplicationRecord
    belongs_to :genre
    attachment :item_image
    has_many :order_items, dependent: :destroy
    has_many :cart_items, dependent: :destroy
    validates :is_selling, presence: true
    validates :item_image_id, presence: true
    validates :price, presence: true
    validates :description, presence: true
    validates :name, presence: true
    validates :genre_id, presence: true
end
