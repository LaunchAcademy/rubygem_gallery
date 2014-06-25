require 'rails_helper'

feature 'sign up', %Q{
  As an unauthenticated user
  I want to sign up
  So that I can start using gem-gallery
} do

  scenario 'specifying valid and required information' do
    user = FactoryGirl.build(:user)

    visit '/'
    click_link 'Sign Up'
    fill_in 'First Name', with: user.first_name
    fill_in 'Last Name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: user.password
    click_button 'Sign Up'

    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign Up")

  end

  scenario 'and failing to confirm password matching' do
    user = FactoryGirl.build(:user)

    visit '/'
    click_link 'Sign Up'
    fill_in 'First Name', with: user.first_name
    fill_in 'Last Name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: "drowssap"
    click_button 'Sign Up'

    expect(page).to have_content("confirmation doesn't match")

  end

  scenario 'and failing to enter required information' do
    user = FactoryGirl.build(:user)

    visit '/'
    click_link 'Sign Up'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: user.password
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
  end

end
