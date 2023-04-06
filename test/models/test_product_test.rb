require "test_helper"

class TestProductTest < ActiveSupport::TestCase
  def setup
    @product = test_products(:one)  
  end 

  test "save product when all field are present" do
    assert @product.save
  end

  test "should not save without all field" do
    user = UserRendering.last
    product = user.test_products.create()
    assert_not product.save, "Saved the product without all field"
  end

  test 'number should be numeric' do
    user = UserRendering.last
    product = user.test_products.new(product_name: "Led", price: "30h000", description: "led")
    assert_not product.valid?
  end

  test 'Invalid without product name' do
    user = UserRendering.last
    product = user.test_products.new(price: "30000", description: "led")
    refute product.valid?
    assert_not_nil product.errors[:product_name], 'no validation error for name present'
  end

  test 'Invalid without product price' do
    user = UserRendering.last
    product = user.test_products.new(product_name: "Led", description: "led")
    refute product.valid?
    assert_not_nil product.errors[:price], 'no validation error for price present'
  end

  test 'Invalid without product description' do
    user = UserRendering.last
    product = user.test_products.new(product_name: "Led", price: "30000")
    refute product.valid?
    assert_not_nil product.errors[:description], 'no validation error for description present'
  end
end
