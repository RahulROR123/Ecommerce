class Category < ApplicationRecord
	has_many :products, dependent: :destroy

	validates :name, presence: true
	validates_uniqueness_of :name
end
