require 'rails_helper'

feature 'user signs in', %Q(
  As an authenticated user
  I want to sign in
  So that I can continue using gem-gallery
) do

  before :each do
    visit root_path
    click_link 'Sign In'
  end

  scenario 'user specifies valid and required information' do
    user = FactoryGirl.create(:user)

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Sign In')
  end

  scenario 'user fails to specify valid and required information' do
    click_button 'Sign In'

    expect(page).to_not have_content('Sign Out')
    expect(page).to have_content('Invalid email or password')
  end
end
