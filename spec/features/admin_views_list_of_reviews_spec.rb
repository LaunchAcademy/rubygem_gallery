require 'rails_helper'

feature 'admin views list of reviews', %Q(
  As an admin
  I want to view a list of all reviews
  So I can delete them more easily
) do

# I must be an admin
# I must see all reviews for all ruby gems
# I must be able to delete each gem

  scenario 'authenticated admin can view list of reviews' do
    review = FactoryGirl.create(:review)
    admin = FactoryGirl.create(:user, role: 'admin')
    login(admin)
    visit admin_reviews_path

    expect(page).to have_content review.rating
    expect(page).to have_content review.body
    expect(page).to have_content 'Delete'
  end

  scenario 'authenticated non-admin cannot view list of reviews' do
    review = FactoryGirl.create(:review)
    user = FactoryGirl.create(:user)
    login(user)
    visit admin_reviews_path

    expect(page).to_not have_content review.rating
    expect(page).to_not have_content review.body
    expect(page).to_not have_content 'Delete'
    expect(page).to have_content 'You are not authorized'
  end

  scenario 'unauthenticated user cannot view list of reviews' do
    review = FactoryGirl.create(:review)
    visit admin_reviews_path

    expect(page).to have_content 'You need to sign in to do that.'
  end
end
