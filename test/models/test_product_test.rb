require "test_helper"

class TestProductTest < ActiveSupport::TestCase
  test "product not save without all field" do
    product = TestProduct.new
    assert_not product.save, "Not saved without all the field."
  end
end
