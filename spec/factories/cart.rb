FactoryBot.define do
  factory :cart do
    # user_id { FactoryBot.create(:user)}
     total_quantity { 3 }
     total_price {1234}
  end
end
