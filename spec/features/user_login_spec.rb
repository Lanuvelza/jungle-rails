require 'rails_helper'

RSpec.feature "Existing user is able to login and then be redirected to the home page", type: :feature, js: true do
  
  # SETUP 
  before :each do 
    @user = User.create!(
      name: 'Alice',
      email: 'alice@example.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  scenario "Existing user logins in and then gets taken to the home page" do
    # ACT 
    visit root_path 

    # VERIFY
    find_link('Login').click

    expect(page).to have_selector('h1', text: 'Login')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')

    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password

    find_button('Submit').click

    expect(page).to have_content('Signed in as ' + @user.name)
    expect(page).to have_content('Logout')
    expect(page).to have_selector('h1', text: 'Products')

    # DEBUG
    save_screenshot
  end
end
