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

    ruby_gem = RubyGem.create!(name: 'Pry', description: 'Debugger')

    visit "/ruby_gems/#{ruby_gem.id}"

    expect(page).to have_content ruby_gem.name
    expect(page).to have_content ruby_gem.description

  end

  scenario 'user views list of reviews for a ruby gem' do

    ruby_gem = RubyGem.create!(name: 'Pry', description: 'Debugger')

    reviews = FactoryGirl.create_list(:review, 3, ruby_gem: ruby_gem)

    visit "/ruby_gems/#{ruby_gem.id}"

    reviews.each do |review|
      expect(page).to have_content(review.rating)
      expect(page).to have_content(review.body)
    end

  end

  scenario 'user adds a new review' do

    ruby_gem = RubyGem.create!(name: 'Pry', description: 'Debugger')

    visit "/ruby_gems/#{ruby_gem.id}"

    fill_in 'Rating', with: '5'
    fill_in 'Body', with: 'Opinion on this gem'
    click_on "Create Review"

    expect(page).to have_content('Success')
    expect(page).to have_content('5')
    expect(page).to have_content('Opinion on this gem')

  end

end



