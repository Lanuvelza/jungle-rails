require 'rails_helper'

RSpec.feature "Visitor can add a product to their cart from the home page and view their cart", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They add a product to their cart and view their cart" do 
    # ACT 
    visit root_path

    # VERIFY

    find_link("My Cart")

    first('article.product').find_button('Add').click

    find_link("My Cart (1)").click

    expect(page).to have_selector('h1', text: 'My Cart')
    expect(page).to have_content('Unit Price')
    expect(page).to have_content('Quantity')
    expect(page).to have_selector('button', text: '+')
    expect(page).to have_selector('button', text: '-')
    expect(page).to have_content('Price')
    expect(page).to have_content("TOTAL:")

    # DEBUG 
    save_screenshot
  end


end
