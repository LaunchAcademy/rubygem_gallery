FactoryGirl.define do
  factory :ruby_gem do
    sequence(:name) { |n| "Generic Ruby Gem #{n}" }
    description 'A gem'
  end
end
