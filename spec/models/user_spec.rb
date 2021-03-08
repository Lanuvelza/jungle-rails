require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do 
    it 'return an error message for blank name' do 
      @user = User.new(
        name: nil, 
        email: 'ian@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Name can't be blank")

    end

    it 'return an error message for blank email' do 
      @user = User.new(
        name: 'Ian Lam', 
        email: nil,
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should be valid for unique emails but not case sensitive' do 
      @user1 = User.new(
        name: 'Ian Lam', 
        email: 'IAN@EXAMPLE.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user1.valid?).to be true
      expect(@user1.errors.size).to eql(0)

      @user1.save

      @user2 = User.new(
        name: 'Ian Lam', 
        email: 'ian@example.com',
        password: 'password',
        password_confirmation: 'password'
      )

      @user2.save

      expect(@user2.errors.full_messages).to include("Email has already been taken")
      
    end

    it "It must be created with a password" do 
      @user = User.new(
        name: 'Ian Lam', 
        email: 'ian@example.com',
        password: nil,
        password_confirmation: 'password'
      )
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "invalid if passwords do not match" do 
      @user = User.new(
        name: 'Ian Lam', 
        email: 'ian@example.com',
        password: 'password',
        password_confirmation: 'jungle'
      )
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

    end

    it "valid if passwords do not match" do 
      @user = User.new(
        name: 'Ian Lam', 
        email: 'ian@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user.valid?).to be true
      expect(@user.errors.size).to eql(0)
    end

    it "The password must have a minimum length of 8 characters when user account is being created" do 
      @user = User.new(
        name: 'Ian Lam', 
        email: 'ian@example.com',
        password: 'pa',
        password_confirmation: 'pa'
      )
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")

    end
  end

  describe '.authenticate_with_credentials' do

    before do 
      @user = User.new(
        name: 'Ian Lam', 
        email: 'ian@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @user.save
    end
    
    it "returns nil if password is incorrect" do
      @user = User.authenticate_with_credentials('ian@example.com', 'passwrod')
      expect(@user).to be nil
    end

    it "returns user even when there are spaces in email" do
      @user = User.authenticate_with_credentials('  ian@example.com  ', 'password')
      expect(@user).not_to be nil
    end

    it "returns user even when there are caps in email" do
      @user = User.authenticate_with_credentials('  IAN@EXAMPLE.com  ', 'password')
      expect(@user).not_to be nil
    end
  end
  
end
