require 'rails_helper'

RSpec.feature "Visitor navigates to product details page from home page", type: :feature, js: true do
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

  scenario "They see product details of a specific product" do
    # ACT
    visit root_path

    # VERIFY 
    first('article.product').find_link('Details').click

    expect(page).to have_content('Name')  
    expect(page).to have_content('Description')  
    expect(page).to have_content('Quantity')
    expect(page).to have_content('Price')
    # DEBUG 
    save_screenshot
  end


end
