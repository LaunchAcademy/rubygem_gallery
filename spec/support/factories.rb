FactoryGirl.define do
  factory :ruby_gem do
    sequence(:name) { |n| "Generic Ruby Gem #{n}" }
    description 'A gem'
  end

  factory :review do
    sequence(:rating) { |n| n }
    body 'This gem sucks'

    ruby_gem
  end

  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    first_name 'John'
    last_name 'Smith'
    password 'password'
    id '1'
  end
end

