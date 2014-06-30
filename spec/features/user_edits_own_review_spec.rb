require 'rails_helper'

feature 'user edits own review', %Q{
  As a user
  I want to edit a review I wrote
  So that I can make changes to it.
} do


  context 'authenticated user' do
    before :each do
      @user = FactoryGirl.create(:user)
      login(@user)
    end

    scenario 'authorized user edits own review' do
      ruby_gem = FactoryGirl.create(:ruby_gem)
      review = FactoryGirl.create(:review, ruby_gem: ruby_gem, user: @user)
      visit edit_review_path(review)

      choose('review_rating_3')
      fill_in 'Body', with: review.body
      click_on 'Update Review'

      expect(page).to have_content('Success')
      expect(page).to have_content review.rating
      expect(page).to have_content review.body
    end

    scenario 'unauthorized user cannot edit someone elses review' do
      ruby_gem = FactoryGirl.create(:ruby_gem)
      review = FactoryGirl.create(:review, ruby_gem: ruby_gem)
      visit ruby_gem_path(ruby_gem)

      expect(page).to_not have_content 'Delete'
    end
  end

  scenario 'unauthenticated user cannot edit review' do
    ruby_gem = FactoryGirl.create(:ruby_gem)
    review = FactoryGirl.create(:review, ruby_gem: ruby_gem)
    visit ruby_gem_path(ruby_gem)

    expect(page).to_not have_content 'Delete'
  end
end
