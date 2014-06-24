require 'rails-helper'

feature "user adds a new rubygem", %Q{
  As a user
  I want to add a verified gem
  So it can be rated and commented on
} do

# I need to be signed in to do this.
# I must provide gem name and description.
# I need to see a success message if submission is successful.
# I need to see an error message if submission is unsuccessful.

  scenario 'user adds a new rubygem' do

    rubygem = Rubygem.new(name: 'Pry', description: 'debugger')

    visit new_rubygem_path

    fill_in 'Name', with: 'Pry'
    fill_in 'Description', with: 'debugger'
    click_button 'Submit'

    expect(Rubygems.count).to eq(1)
    expect(page).to have_content('Success')
    expect(page).to have_content('Pry')
    expect(page).to have_content('debugger')
  end
end
