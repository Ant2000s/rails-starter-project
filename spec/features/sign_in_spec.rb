require 'rails_helper'

describe 'the sign in process', type: :feature do
  User.create(email: 'user@test.com', password: 'test')
  it 'sign @user in' do
    visit '/sign_in'
    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign In'
    expect(page).to have_current_path(sign_in_path, ignore_query: true)
  end
end
