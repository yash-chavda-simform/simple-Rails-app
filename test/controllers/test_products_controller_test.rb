require "test_helper"

class TestProductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = user_renderings(:one)
    @product = test_products(:one)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'TestProduct.count' do
      post test_products_path, params: { test_product: { product_name: "Test Product", description: "This is a test product", price: 10.0 } }
    end
    assert_redirected_to new_user_rendering_session_path
  end

  test "should create product when logged in" do
    sign_in @user
    assert_difference 'TestProduct.count', 1 do
      post test_products_path, params: { test_product: { product_name: "Test Product", description: "This is a test product", price: 10.0 } }
    end
    assert_redirected_to test_products_path	
  end

  test "should not delete data when not logged in" do 
    assert_no_difference 'TestProduct.count' do
      delete test_product_path(@product)
    end
    assert_redirected_to new_user_rendering_session_path
  end

  test "should delete data when not logged in" do 
    sign_in @user
    assert_difference 'TestProduct.count', -1 do
      delete test_product_path(@product)
    end
    assert_redirected_to test_products_path
  end
end
