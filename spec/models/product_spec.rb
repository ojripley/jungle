require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validation' do
    # Validation tests go here
    it 'is valid' do
      @product = Product.new()
      @category = Category.new

      @product.name = 'name'
      @product.id = 1
      @product.price = 10
      @product.quantity = 20
      @product.category = @category
      expect(@product).to be_valid
    end

    it 'is invalid when provided with no name' do
      @product = Product.new()
      @category = Category.new

      @product.name = nil
      @product.id = 1
      @product.price = 10
      @product.quantity = 20
      @product.category = @category
      expect(@product).to_not be_valid
    end

    it 'is invalid when provided with no price' do
      @product = Product.new()
      @category = Category.new

      @product.name = 'name'
      @product.id = 1
      @product.price = nil
      @product.quantity = 20
      @product.category = @category
      expect(@product).to_not be_valid
    end

    it 'is invalid when provided with no quantity' do
      @product = Product.new()
      @category = Category.new

      @product.name = 'name'
      @product.id = 1
      @product.price = 30
      @product.quantity = nil
      @product.category = @category
      expect(@product).to_not be_valid
    end

    it 'is invalid when provided with no category' do
      @product = Product.new()
      @category = Category.new

      @product.name = 'name'
      @product.id = 1
      @product.price = 10
      @product.quantity = 20
      @product.category = nil
      expect(@product).to_not be_valid
    end
  end
end
