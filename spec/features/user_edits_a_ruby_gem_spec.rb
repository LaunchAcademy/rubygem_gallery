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

  scenario 'user edits a existing ruby gem' do
    rubygem = RubyGem.create!(name: 'Pry', description: 'debugger')

    visit edit_ruby_gem_path(rubygem.id)

    fill_in 'Name', with: 'Capybara'
    fill_in 'Description', with: 'testing'
    click_on "Update Ruby gem"

    expect(page).to have_content('Success')
    expect(page).to have_content('Capybara')
    expect(page).to have_content('testing')
  end

  scenario 'user sees error message if fields empty' do
    rubygem = RubyGem.create!(name: 'Pry', description: 'debugger')

    visit edit_ruby_gem_path(rubygem.id)
    fill_in 'Name', with: ' '
    fill_in 'Description', with: ' '
    click_on "Update Ruby gem"

    expect(page).to_not have_content('Success')
    expect(page).to have_content("can't be blank")
  end

end
