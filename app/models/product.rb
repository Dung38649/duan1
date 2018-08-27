class Product < ApplicationRecord
    mount_uploaders :images, ImageUploader
    serialize :images, JSON
    has_many :products_categories
    has_many :categories, through: :products_categories
    validates :name, presence: true,
    length: { minimum: 3 }

   
end
