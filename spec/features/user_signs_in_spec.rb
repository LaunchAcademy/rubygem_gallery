require 'rails_helper'

feature 'user signs in', %Q(
  As an authenticated user
  I want to sign in
  So that I can continue using gem-gallery
) do

  scenario 'specifying valid and required information' do
    user = FactoryGirl.create(:user)

    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Sign In')

  end

  scenario 'and failing to enter required information' do

    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    click_button 'Sign In'

    expect(page).to have_content('Invalid email or password')
  end

  scenario 'and failing to provide valid information' do

    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: 'bob@example.com'
    fill_in 'Password', with: 'dropssap'
    click_button 'Sign In'

    expect(page).to have_content('Invalid email or password')
  end

end
