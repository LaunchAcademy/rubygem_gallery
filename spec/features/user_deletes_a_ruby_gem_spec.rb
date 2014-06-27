require 'rails_helper'

feature "user deletes a ruby gem", %Q{
  As a user
  I want to delete a ruby gem that I created
  So I don't see again.
} do

# I need to be the author of this gem
# I need to click a link to delete this ruby gem
# I need to be prompted to be sure I want to delete this gem
# I want to delete reviews associated with this ruby gem
# I need to see a success message if submission is successful.
# I need to see an error message if submission is unsuccessful.

  context 'authenticated user' do
    before :each do
      @user = FactoryGirl.create(:user)
      login(@user)
    end

    scenario 'authorized user deletes ruby gem' do
      ruby_gem = FactoryGirl.create(:ruby_gem, user: @user)
      visit ruby_gem_path(ruby_gem)

      click_on "Delete"

      expect(page).to have_content 'Deleted'
    end

    scenario 'unauthorized user cannot delete ruby gem' do
      ruby_gem = FactoryGirl.create(:ruby_gem)
      visit ruby_gem_path(ruby_gem)

      expect(page).to_not have_content('Delete')
    end
  end

  scenario 'unauthenticated user cannot delete ruby gem' do
    ruby_gem = FactoryGirl.create(:ruby_gem)
    visit ruby_gem_path(ruby_gem)

    expect(page).to_not have_content('Delete')
  end
end
