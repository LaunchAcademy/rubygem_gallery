require 'rails_helper'
require 'spec_helper'

feature "author of gem receives email", %Q{
  As a user
  I want to be emailed when someone reviews a gem I posted
  So that I know people are discussing it
} do

  context 'authenticated user' do

    scenario 'author receives email after valid review submission' do
      @user = FactoryGirl.create(:user)
      login(@user)
      @ruby_gem = FactoryGirl.create(:ruby_gem)
      visit ruby_gem_path(@ruby_gem)
      ActionMailer::Base.deliveries = []

      review = FactoryGirl.create(:review)

      choose 'review_rating_3'
      fill_in 'Body', with: review.body
      click_on "Create Review"

      expect(page).to have_content 'Success'

      expect(ActionMailer::Base.deliveries.size).to eql(1)
      # the email we just sent should have the proper subject and recipient:
      last_email = ActionMailer::Base.deliveries.last
      expect(last_email).to have_subject 'New Review'
      expect(last_email).to deliver_to 'user@example.com'
      expect(last_email).to have_body_text @ruby_gem.name
    end

    scenario 'author does not receive email after invalid review submission' do
      # @user = FactoryGirl.create(:user)
      # login(@user)
      # @ruby_gem = FactoryGirl.create(:ruby_gem)
      # visit ruby_gem_path(@ruby_gem)
      # ActionMailer::Base.deliveries = []

      # review = FactoryGirl.create(:review)

      # choose 'review_rating_3'
      # fill_in 'Body', with: review.body
      # click_on "Create Review"

      # expect(page).to have_content 'Success'

      # expect(ActionMailer::Base.deliveries.size).to eql(1)
      # # the email we just sent should have the proper subject and recipient:
      # last_email = ActionMailer::Base.deliveries.last
      # expect(last_email).to have_subject 'New Review'
      # expect(last_email).to deliver_to 'user@example.com'
      # expect(last_email).to have_body_text @ruby_gem.name
    end

  end

  scenario "author does not receive email when unauthenticated user visits page" do
    #not the right test, might not need this test
  end
end
