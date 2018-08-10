class Product < ApplicationRecord
    has_many :products_categories
    has_many :categories, through: :products_categories
    validates :name, presence: true,
    length: { minimum: 3 }
end
