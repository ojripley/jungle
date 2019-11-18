require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do

    it 'is valid when created with all properties' do
      @user = User.new

      @user.name = 'frank'
      @user.email = 'o@m.com'
      @user.password = 'bn'
      @user.password_confirmation = 'bn'

      expect(@user).to be_valid
    end

    it 'is invalid when created without a name' do
      @user = User.new

      @user.name = nil
      @user.email = 'o@m.com'
      @user.password = 'bn'
      @user.password_confirmation = 'bn'

      expect(@user).to_not be_valid
    end

    it 'is invalid when created without an email' do
      @user = User.new

      @user.name = 'frank'
      @user.email = nil
      @user.password = 'bn'
      @user.password_confirmation = 'bn'

      expect(@user).to_not be_valid
    end

    it 'is invalid when created without a password' do
      @user = User.new

      @user.name = 'frank'
      @user.email = 'o@m.com'
      @user.password = nil
      @user.password_confirmation = 'bn'

      expect(@user).to_not be_valid
    end

    it 'is invalid when created without a confirmation password' do
      @user = User.new

      @user.name = 'frank'
      @user.email = 'o@m.com'
      @user.password = 'bn'
      @user.password_confirmation = nil

      expect(@user).to_not be_valid
    end

    it 'is invalid when created with passwords that do not match' do
      @user = User.new

      @user.name = 'frank'
      @user.email = 'o@m.com'
      @user.password = 'bn'
      @user.password_confirmation = 'bln'

      expect(@user).to_not be_valid
    end

    it 'is invalid when created with identical emails' do
      @user = User.new
      @user2 =User.new

      @user.name = 'user1'
      @user.email = 'o@m.com'
      @user.password = 'bn'
      @user.password_confirmation = 'bn'

      @user.save

      @user2.name = 'user1'
      @user2.email = 'o@m.com'
      @user2.password = 'bn'
      @user2.password_confirmation = 'bn'

      expect(@user2).to_not be_valid
    end

    it 'is invalid when created with case insensitive equal emails' do
      @user = User.new
      @user2 =User.new

      @user.name = 'user1'
      @user.email = 'o@m.com'
      @user.password = 'bn'
      @user.password_confirmation = 'bn'

      @user.save

      @user2.name = 'user1'
      @user2.email = 'O@m.com'
      @user2.password = 'bn'
      @user2.password_confirmation = 'bn'

      expect(@user2).to_not be_valid
    end
  end
end
