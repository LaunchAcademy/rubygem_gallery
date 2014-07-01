require 'rails_helper'

feature "user searches for a ruby gem", %Q(
  As a user
  I want to search for a ruby gem
  So that I can find the one I want
) do

# I need to enter something in the form if I want to narrow results
# I need to see a list of gems that match the search parameters
# If I leave it blank I should see the complete list of ruby gems

  scenario 'user searches for a ruby gem' do
    rubygem1 = FactoryGirl.create(:ruby_gem)
    rubygem2 = FactoryGirl.create(:ruby_gem, name: 'newname')

    visit ruby_gems_path

    fill_in 'search_field', with: rubygem1.name
    click_on 'Search'

    expect(page).to have_content rubygem1.name
    expect(page).to_not have_content rubygem2.name
  end

  scenario 'user leaves the search form blank' do
    rubygem1 = FactoryGirl.create(:ruby_gem)
    rubygem2 = FactoryGirl.create(:ruby_gem, name: 'newname')

    visit ruby_gems_path

    click_on 'Search'

    expect(page).to have_content rubygem1.name
    expect(page).to have_content rubygem2.name
  end
end
