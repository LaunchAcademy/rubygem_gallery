require 'rails_helper'

feature 'user votes on a review', %Q(
  As an authenitcated user
  I want to vote up or down on a review
  I want to change my vote
) do

  context 'authenticated user' do
    before :each do
      @user = FactoryGirl.create(:user)
      login(@user)
      ruby_gem = FactoryGirl.create(:ruby_gem, user: @user)
      review = FactoryGirl.create(:review, ruby_gem: ruby_gem, user: @user)
      visit ruby_gem_path(ruby_gem)

    end

    scenario 'user clicks vote up' do
      click_button 'Vote Up'

      expect(page).to have_selector("input[type=submit][value='Vote Down']")
      expect(page).to_not have_selector("input[type=submit][value='Vote Up']")
    end

    scenario 'user changes vote' do
      click_button 'Vote Up'

      expect(page).to have_selector("input[type=submit][value='Vote Down']")
      expect(page).to_not have_selector("input[type=submit][value='Vote Up']")

      click_button 'Vote Down'

      expect(page).to have_selector("input[type=submit][value='Vote Up']")
      expect(page).to_not have_selector("input[type=submit][value='Vote Down']")
    end
  end

  scenario "unauthenticated user can't vote" do

    expect(page).to_not have_selector("input[type=submit][value='Vote Up']")
    expect(page).to_not have_selector("input[type=submit][value='Vote Down']")
  end
end
