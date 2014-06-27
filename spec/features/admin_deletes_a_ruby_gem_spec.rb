require 'rails_helper'

feature "admin deletes a ruby gem", %Q{
  As an admin
  I want to delete a ruby gem
  So I can get rid of inappropriate gems
} do

# I need to be an admin
# I need to be able to delete any ruby gem
# I need to see a success message if it is deleted
# I need to see an error message if it is not deleted


  scenario 'authenticated admin can delete ruby gem' do
    ruby_gem = FactoryGirl.create(:ruby_gem)
    admin = FactoryGirl.create(:user, role: 'admin')
    login(admin)
    visit ruby_gem_path(ruby_gem)

    click_on 'Delete'

    expect(page).to have_content 'Deleted'
  end

  scenario 'authenticated non-admin cannot delete ruby gem' do
    ruby_gem = FactoryGirl.create(:ruby_gem)
    user = FactoryGirl.create(:user)
    login(user)
    visit ruby_gem_path(ruby_gem)

    expect(page).to_not have_content('Delete')
  end

  scenario 'unauthenticated user cannot delete ruby gem' do
    ruby_gem = FactoryGirl.create(:ruby_gem)
    visit ruby_gem_path(ruby_gem)

    expect(page).to_not have_content('Delete')
  end
end
