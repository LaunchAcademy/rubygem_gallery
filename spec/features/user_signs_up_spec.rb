require 'rails_helper'

feature 'sign up', %Q{
  As an unauthenticated user
  I want to sign up
  So that I can start using gem-gallery
} do

  before :each do
    visit root_path
    click_link 'Sign Up'
  end

  context 'user completes all form fields' do
    before :each do
      user = FactoryGirl.build(:user)
      fill_in 'First Name', with: user.first_name
      fill_in 'Last Name', with: user.last_name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end

    scenario 'specifying valid and required information with photo' do
      fill_in 'Password Confirmation', with: user.password
      attach_file 'Profile Photo', File.join(Rails.root, '/spec/support/example.jpg')
      click_button 'Sign Up'

      expect(page).to have_image('/spec/support/example.jpg')
      expect(page).to have_content('Sign Out')
      expect(page).to_not have_content('Sign Up')
    end

    scenario 'and failing to confirm password matching' do
      fill_in 'Password Confirmation', with: 'drowssap'
      click_button 'Sign Up'

      expect(page).to have_content("confirmation doesn't match")
    end
  end

  scenario 'user fails to enter required information' do
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
  end
end
