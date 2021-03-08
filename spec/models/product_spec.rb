require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "should be valid when all fields of the forms is filled" do 
      @category = Category.new 
      @category.name = 'pets'
      @product = Product.new
      @product.name = 'Corgi'
      @product.price_cents = 15000 
      @product.quantity = 10
      @product.category = @category
      expect(@product.valid?).to be true
      expect(@product.errors.size).to eql(0)
    end

    it "return an error message for blank name" do 
      @category = Category.new
      @category.name = 'pets'
      @product = Product.new 
      @product.name = nil 
      @product.price_cents = 15000 
      @product.quantity = 10
      @product.category = @category
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "return an error message for blank price_cents" do 
      @category = Category.new
      @category.name = 'pets'
      @product = Product.new 
      @product.name = 'Corgi' 
      @product.price_cents = nil 
      @product.quantity = 10
      @product.category = @category
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Price can't be blank")

    end

    it "return an error message for blank quantity" do 
      @category = Category.new
      @category.name = 'pets'
      @product = Product.new 
      @product.name = 'Corgi' 
      @product.price_cents = 15000 
      @product.quantity = nil
      @product.category = @category
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Quantity can't be blank")

    end

    it "return an error message for blank category id" do 
      @category = Category.new
      @category.name = 'pets'
      @product = Product.new 
      @product.name = 'Corgi' 
      @product.price_cents = 15000 
      @product.quantity = 10
      @product.category = nil
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
