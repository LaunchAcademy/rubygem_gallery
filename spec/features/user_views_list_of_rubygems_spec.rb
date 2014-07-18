require 'rails_helper'

feature "user views list of ruby gems", %Q{
  As a user
  I want to view the complete list of gems
  So I can learn about new gems
} do

# I don't need to be signed in
# I need to see all the ruby gem names

  scenario 'user views list of ruby gem names' do
    ruby_gems = FactoryGirl.create_list(:ruby_gem, 3)
    visit ruby_gems_path

    ruby_gems.each do |ruby_gem|
      expect(page).to have_content(ruby_gem.name)
    end
  end
end
