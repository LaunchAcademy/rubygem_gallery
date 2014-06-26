require 'rails_helper'

feature "user can edit their ruby gem", %Q{
  As a user
  I want to be able to edit the ruby gem I created
  So I can fix it.
} do

# TODO integrate current user with ruby gem to edit only their ruby gem
# TODO I must be signed in to do this
# Every field must be filled
# I need to see a success message if submission is successful.
# I need to see an error message if submission is unsuccessful.

  context 'authenticated user' do
    before :each do
      @user = FactoryGirl.create(:user)
      login(@user)
    end

    scenario 'user edits own ruby gem' do
      ruby_gem = FactoryGirl.create(:ruby_gem, user: @user)

      visit edit_ruby_gem_path(ruby_gem.id)

      fill_in 'Name', with: ruby_gem.name
      fill_in 'Description', with: ruby_gem.description
      click_on "Update Ruby gem"

      expect(page).to have_content('Success')
      expect(page).to have_content ruby_gem.name
      expect(page).to have_content ruby_gem.description
    end

    scenario 'authorized user sees error message if form incomplete' do
      ruby_gem = FactoryGirl.create(:ruby_gem, user: @user)

      visit edit_ruby_gem_path(ruby_gem.id)
      fill_in 'Name', with: ''
      fill_in 'Description', with: ''
      click_on "Update Ruby gem"    #change this to Ruby Gem

      expect(page).to_not have_content('Success')
      expect(page).to have_content("can't be blank")
    end

    scenario 'unauthorized user cannot edit ruby gem' do
      ruby_gem = FactoryGirl.create(:ruby_gem)
      visit ruby_gem_path(ruby_gem)

      expect(page).to_not have_content('Edit')
    end
  end

  scenario 'unauthenticated user cannot edit ruby gem' do
    ruby_gem = FactoryGirl.create(:ruby_gem)
    visit ruby_gem_path(ruby_gem)

    expect(page).to_not have_content('Edit')
  end
end
