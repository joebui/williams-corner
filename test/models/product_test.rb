require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  puts "Create example game with name: 'Example Product', price: '234', img:'http://', genre: 'RPG'"
  
  def setup
    @product = Product.new(name: "Example Product", price: '234', img: 'http://', genre: "RPG")
  end
  
  puts "First test, validation test, no change."
  test "validation test" do
    assert @product.valid?, "invalid example"
  end
  
  puts "Second test, change name to null."
  test "name should be present" do
    @product.name = ''
    assert @product.valid?, "Test succeeded. Reason for Failure: Game name is empty."
  end

  puts "Third test, change name to fewer than 3 characters."
  test "name length should be longer than 3" do
    @product.name = 'Ex'
    assert @product.valid?, "Test succeeded. Reason for Failure: Game name's length < 3"
  end
  
  puts "Fourth test, change price to null."
  test "price should be present" do
    @product.price = ''
    assert @product.valid?, "Test succeeded. Reason for Failure: Price is empty."
  end
  
  puts "Fifth test, change price to non-numerical."
  test "price should be numericality" do
    @product.price = '23a'
    assert @product.valid?, "Test succeeded. Reason for Failure: Price contain non-numerical."
  end
  
  puts "Sixth test, change image URL to null."
  test "img should be present" do
    @product.img = ''
    assert @product.valid?, "Test succeeded. Reason for Failure: No image URL."
  end

  puts "Seventh test, change genre to null."
  test "genre should be present" do
    @product.genre = ''
    assert @product.valid?, "Test succeeded. Reason for Failure: Genre is left empty."
  end
  
end
