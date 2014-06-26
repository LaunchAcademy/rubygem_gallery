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

  context 'authenticated user' do
    before :each do
      @user = FactoryGirl.create(:user)
      login(@user)
      @ruby_gem = FactoryGirl.create(:ruby_gem)
      visit ruby_gem_path(@ruby_gem)
    end

    scenario 'user adds a new review' do
      review = FactoryGirl.create(:review)

      fill_in 'Rating', with: review.rating
      fill_in 'Body', with: review.body
      click_on "Create Review"

      expect(page).to have_content('Success')
      expect(page).to have_content review.rating
      expect(page).to have_content review.body
    end

    scenario 'user does not supply a rating' do
      click_on "Create Review"

      expect(page).to_not have_content('Success')
      expect(page).to have_content("There was an error")
    end
  end

  scenario 'unauthenticated user cannot add review' do
    ruby_gem = FactoryGirl.create(:ruby_gem)
    visit ruby_gem_path(ruby_gem)

    expect(page).to have_content('You must be signed in')
  end
end
