# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Features

* Users can browse a list of products from the homepage
* Users can filter the list of products to browse by selecting a category 
* Users can view the product details by selecting a specific product  
* Users can add and remove products from their cart 
* Users can view their order details once the transaction has been completed
* Items that are out of stock are displayed with a sold out badge 
* Users can signup, login and logout from any page 
* User passwords is encrypted through bcrypt
* Admin users can add and remove products or categories 
* Admin users can view the number of existing products and categories via the dashboard

## Tech Stack 

Front-End: Ruby, JQuery-Rails, SCSS 

Back-End: Rails, PSQL

Testing: Rspec, Capybara, Poltergiest, Phantom 

## Final Product

## User Section 
### Home Page 
Main page displaying a list of all available products. 
!["Screenshot for Homepage"](https://github.com/Lanuvelza/jungle-rails/blob/master/doc/home-page.png?raw=true)

### About Us Page 
Displays the about us page.
!["Screenshot for About Us"](https://github.com/Lanuvelza/jungle-rails/blob/master/doc/about-us.png?raw=true)

### Category Menu 
Displays a list of all avaiable categories.
!["Screenshot for Category Menu"](https://github.com/Lanuvelza/jungle-rails/blob/master/doc/categories-filter.png?raw=true)

### Products belonging to specific category 
Display products belonging to a selected category. 
!["Screenshot for furniture page"](https://github.com/Lanuvelza/jungle-rails/blob/master/doc/furniture-page.png?raw=true)

### Product Details 
Display details of a specific product.
!["Screenshot for product details"](https://github.com/Lanuvelza/jungle-rails/blob/master/doc/product-details.png?raw=true)

### My Cart 
Displays the contents of the cart.   
!["Screenshot for my cart"](https://github.com/Lanuvelza/jungle-rails/blob/master/doc/my-cart.png?raw=true)

### Order Summary
Displays the order details, once the order has been confirmed. 
!["Screenshot for order details"](https://github.com/Lanuvelza/jungle-rails/blob/master/doc/order-details.png?raw=true)

### Registration Page 
Registration form for new users. 
!["Screenshot for registration"](https://github.com/Lanuvelza/jungle-rails/blob/master/doc/sign-up.png?raw=true)

### Login Page 
Login form for existing users. 
!["Screenshot for login"](https://github.com/Lanuvelza/jungle-rails/blob/master/doc/login.png?raw=true)


### Logged User 
Logged users will see that they are signed in up at the navigation bar. 
!["Screenshot for logged user"](https://github.com/Lanuvelza/jungle-rails/blob/master/doc/logged-user.png?raw=true)

## Admin Section 

### Admin Menu 
Dropdown menu displaying tabs only accessible to admin users. 
!["Screenshot for admin menu"](https://github.com/Lanuvelza/jungle-rails/blob/master/doc/admin-menu.png?raw=true)

### Admin Dashboard
Displays an overview of the current number of existing categories and products available. 
!["Screenshot for admin dashboard"](https://github.com/Lanuvelza/jungle-rails/blob/master/doc/admin-dashboard.png?raw=true)

### Admin Products 
Manage the list of products available. 
!["Screenshot for admin products"](https://github.com/Lanuvelza/jungle-rails/blob/master/doc/admin-products.png?raw=true)

### New Product  
New product creation form. 
!["Screenshot for new product"](https://github.com/Lanuvelza/jungle-rails/blob/master/doc/admin-new-product.png?raw=true)

### Admin Categories 
Manage the list of categories. 
!["Screenshot for admin categories"](https://github.com/Lanuvelza/jungle-rails/blob/master/doc/admin-categories.png?raw=true)


### New Category 
New category creation form. 
!["Screenshot for new category"](https://github.com/Lanuvelza/jungle-rails/blob/master/doc/admin-new-category.png?raw=true)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Testing 

* Rspec
* Capybara
* Poltergeist 