require 'rails_helper'

feature "user views ruby gem show page", %Q{
  As a user
  I want to click a link to an individual Ruby gem page
  So I can learn more about it and what people think about it
} do

# I don't need to be signed in

# I need to see the gem name and description
# I need to see all the reviews for the gem
# I need to see a form to submit a review of the gem

  scenario 'user views ruby gem name and description' do
    ruby_gem = FactoryGirl.create(:ruby_gem)
    reviews = FactoryGirl.create_list(:review, 3, ruby_gem: ruby_gem)
    visit ruby_gem_path(ruby_gem)

    expect(page).to have_content ruby_gem.name
    expect(page).to have_content ruby_gem.description

    reviews.each do |review|
      expect(page).to have_content(review.rating)
      expect(page).to have_content(review.body)
    end
  end
end



