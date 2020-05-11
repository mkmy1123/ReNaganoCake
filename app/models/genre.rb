class Genre < ApplicationRecord
    has_many :items
    validates :name, :is_valid, presence: true
end
