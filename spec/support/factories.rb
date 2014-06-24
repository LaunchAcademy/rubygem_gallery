


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
end
