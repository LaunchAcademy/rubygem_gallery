# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    first_name 'John'
    last_name 'Smith'
    password 'password'
  end

  factory :ruby_gem do
    # user

  end
end

# user = FactoryGirl.create(:user)
# ruby_gem = FactoryGirl.create(:ruby_gem, user: user)

# ruby_gem.user
