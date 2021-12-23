FactoryBot.define do
  factory :merchant do
    name { "John" }
  end
  factory :item do
    name { "Fun Item" }
    description { "This is a really fun item"}
    unit_price { 42.91 }
    association :merchant
  end
end
