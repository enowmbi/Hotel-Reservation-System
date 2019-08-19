FactoryBot.define do
  factory :room do
    sequence(:room_number) {|n| "#{n}" }
    description { "Room #{room_number} description" }
    room_category 
  end
end
