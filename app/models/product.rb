class Product < ApplicationRecord
	has_one_attached :image
	belongs_to :category, optional: true
	belongs_to :user
	has_many :cart_items, dependent: :destroy
	has_many :carts, through: :cart_items 

	validates :name, :price, presence: true
end
