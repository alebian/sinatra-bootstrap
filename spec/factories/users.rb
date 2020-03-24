FactoryBot.define do
  factory :user, class: 'Models::User' do
    sequence(:email) { |n| "#{n}_#{Faker::Internet.email}" }
  end
end
