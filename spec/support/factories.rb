FactoryGirl.define do
  factory :ruby_gem do
    sequence(:name) { |n| "Generic Ruby Gem #{n}" }
    description 'A gem'

    user
  end

  factory :review do
    rating 1
    body 'This gem sucks'

    ruby_gem
    user
  end

  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    first_name 'John'
    last_name 'Smith'
    password 'password'
    role 'member'
  end
end

