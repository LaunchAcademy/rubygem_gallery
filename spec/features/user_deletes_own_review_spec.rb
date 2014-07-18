require 'rails_helper'

feature 'user deletes own review', %Q(
  As a user
  I want to delete a review I wrote
  So nobody sees it again.
) do

  context 'authenticated user' do
    before :each do
      @user = FactoryGirl.create(:user)
      login(@user)
      @ruby_gem = FactoryGirl.create(:ruby_gem)
    end

    scenario 'authorized user deletes own review' do
      review = FactoryGirl.create(:review, ruby_gem: @ruby_gem, user: @user)
      visit ruby_gem_path(@ruby_gem)
      click_on "Delete"

      expect(page).to have_content('Deleted')
    end

    scenario 'unauthorized user cannot delete someone elses review' do
      review = FactoryGirl.create(:review, ruby_gem: @ruby_gem)
      visit ruby_gem_path(@ruby_gem)

      expect(page).to_not have_content('Delete')
    end
  end

  scenario 'unauthenticated user cannot delete review' do
    ruby_gem = FactoryGirl.create(:ruby_gem)
    visit ruby_gem_path(ruby_gem)
    review = FactoryGirl.create(:review)

    expect(page).to_not have_content('Delete')
  end
end
