# frozen_string_literal: true

require 'rails_helper'

feature 'Users can sign up', js: true, type: :feature do
  scenario 'user signs up for new account' do
    visit '/users/sign_up'
    fill_in 'user_email', with: 'example@example.com'
    fill_in 'user_password', with: 'examplepassword'
    fill_in 'user_password_confirmation', with: 'examplepassword'
    click_button 'Sign up'

    expect(page).to have_content('Friends')
  end
end

feature 'Users can log in', js: true, type: :feature do
  scenario 'user who has not signed up yet cannot log in' do
    visit new_user_session_path
    fill_in 'user_email', with: 'example@example.com'
    fill_in 'user_password', with: 'examplepassword'
    click_button 'Log in'

    expect(page).to have_content('Log in')
  end

  scenario 'user with an account can log in' do
    visit new_user_session_path
    fill_in 'user_email', with: 'example@example.com'
    fill_in 'user_password', with: 'examplepassword'
    click_button 'Log in'

    expect(page).to have_content('Log in')
  end
end
