require 'rails_helper'

feature "user adds a new ruby gem", %Q{
  As a user
  I want to add a verified gem
  So it can be rated and commented on
} do

# TODO I need to be signed in to do this.
# I must provide gem name and description.
# I need to see a success message if submission is successful.
# I need to see an error message if submission is unsuccessful.

  scenario 'user adds a new ruby gem' do
    rubygem = RubyGem.new(name: 'Pry', description: 'debugger')

    visit new_ruby_gem_path

    fill_in 'Name', with: 'Pry'
    fill_in 'Description', with: 'debugger'
    click_on "Create Ruby gem"

    expect(page).to have_content('Success')
    expect(page).to have_content('Pry')
    expect(page).to have_content('debugger')
  end

  scenario 'user enters incomplete ruby gem info' do

    visit new_ruby_gem_path

    click_on "Create Ruby gem"

    expect(page).to_not have_content('Success')
    expect(page).to have_content("can't be blank")

  end
end
