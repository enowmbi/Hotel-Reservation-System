FactoryBot.define do
  factory :room_category do
   sequence(:name) {|n| "MyString #{n}" }
    description { "Description of #{name}" }
    price { "9.99" }
  end
end
