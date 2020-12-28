require 'rails_helper'

feature 'the signup process' do

  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'New user'
  end

  feature 'signing up a user' do

    before(:each) do
      visit new_user_url
      fill_in 'username', with: 'testing_username'
      fill_in 'password', with: 'good_password'
      click_on 'Create User'
    end

    scenario 'redirects to dashboard page after signup' do
      expect(page).to have_content 'Dashboard Page'
    end

  end


end
