require 'rails_helper'

feature "user adds a new review", %Q{
    As a user
    I want to review a gem
    So people know what I think about it
} do

# I need to be signed in
# I need to see the form on the ruby gem show page
# I need to supply a rating
# I may optionally supply a body
# I need to see a success message if it submits successfully
# I need to see an error message if it does not save

  scenario 'user adds a new review' do

    ruby_gem = FactoryGirl.create(:ruby_gem)
    review = FactoryGirl.create(:review)

    visit "/ruby_gems/#{ruby_gem.id}"

    fill_in 'Rating', with: review.rating
    fill_in 'Body', with: review.body
    click_on "Create Review"

    expect(page).to have_content('Success')
    expect(page).to have_content review.rating
    expect(page).to have_content review.body

  end

  scenario 'user does not supply a rating' do

    ruby_gem = FactoryGirl.create(:ruby_gem)
    visit "/ruby_gems/#{ruby_gem.id}"

    click_on "Create Review"

    expect(page).to_not have_content('Success')
    expect(page).to have_content("There was an error")

  end

end
