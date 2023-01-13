

# require 'rails_helper'

# RSpec.describe Category, type: :model do
#   it "has many products" do
#     category = Category.create(name: "Apparel")
#     product1 = Product.create(category: category)
#     product2 = Product.create(category: category)
#     expect(category.products).to match_array([product1, product2])
#   end

#   it "destroys associated products when destroyed" do
#     category = Category.create(name: "Apparel")
#     product1 = Product.create(category: category)
#     product2 = Product.create(category: category)
#     expect { category.destroy }.to change { Product.count }.by(-2)
#   end

#   it "is invalid without a name" do
#     category = Category.new(name: nil)
#     expect(category).to be_invalid
#   end

#   it "is invalid with a duplicate name" do
#     Category.create(name: "Apparel")
#     category = Category.new(name: "Apparel")
#     expect(category).to be_invalid
#   end
# end

