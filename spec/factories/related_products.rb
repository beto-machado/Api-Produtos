FactoryBot.define do
  factory :related_product do
    name { "MyString" }
    price { "9.99" }
    product { nil }
  end
end
