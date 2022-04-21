FactoryBot.define do
  factory :item do
    name              { Faker::Name.initials(number: 2) }
    address           { '東京' }
    latitude          { '123' }
    studios           { '122' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
