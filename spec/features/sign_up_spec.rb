require 'rails_helper'

describe 'the sign up process', type: :feature do
  User.create(email: 'user1@gmail.com', password: 'password')
  it 'sign @user up' do
    visit '/sign_up'
    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign Up'
    expect(page).to have_current_path(root_path, ignore_query: true)
    expect(page).to have_text('Logged in as: user1@gmail.com')
  end
end
