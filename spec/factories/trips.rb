FactoryBot.define do
  factory :trip do
    association :user
    title { FFaker::CheesyLingo::title }
    description { FFaker::CheesyLingo::sentence }
    city { FFaker::Address::city }
    country { FFaker::Address::country }
    start_date { Date.new(2018, 02, 01) }
    end_date { Date.new(2018, 02, 03) }
  end
end
