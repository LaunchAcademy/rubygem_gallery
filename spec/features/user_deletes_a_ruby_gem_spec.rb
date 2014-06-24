require 'rails_helper'

feature "user deletes a ruby gem", %Q{
  As a user
  I want to delete a ruby gem that I created
  So I don't see again.
} do

# TODO need to be author / admin of ruby gem
# Want to click link to delete ruby gem
# Prompt to be sure you want to delete
# I want to delete reviews associated with this ruby gem
# I need to see a success message if submission is successful.
# I need to see an error message if submission is unsuccessful.

  scenario 'user delets ruby gem' do
    rubygem = RubyGem.create!(name: 'Pry', description: 'debugger')

    visit ruby_gem_path(rubygem)

    click_on "Delete"

    expect(page).to have_content 'Deleted'
    expect(page).to_not have_content 'Error'
  end
end
