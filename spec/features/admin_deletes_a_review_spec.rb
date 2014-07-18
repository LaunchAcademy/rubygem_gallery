require 'rails_helper'

feature "admin deletes a review", %Q(
  As an admin
  I want to delete a review
  So I can get rid of inappropriate reviews
) do

# I need to be an admin
# I need to be able to delete any review
# I need to see a success message if it is deleted
# I need to see an error message if it is not deleted

  before :each do
    @ruby_gem = FactoryGirl.create(:ruby_gem)
    @review = FactoryGirl.create(:review, ruby_gem: @ruby_gem)
  end

  scenario 'authenticated admin can delete review' do
    admin = FactoryGirl.create(:user, role: 'admin')
    login(admin)
    visit ruby_gem_path(@ruby_gem)

    within '.reviews' do
      click_on 'Delete'
    end

    expect(page).to have_content('Deleted')
  end

  scenario 'authenticated non-admin cannot delete review' do
    user = FactoryGirl.create(:user)
    login(user)
    visit ruby_gem_path(@ruby_gem)

    expect(page).to_not have_content('Delete')
  end

  scenario 'unauthenticated user cannot delete review' do
    visit ruby_gem_path(@ruby_gem)

    expect(page).to_not have_content('Delete')
  end
end
