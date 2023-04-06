require 'rails_helper'
RSpec.describe "CheckRequests", type: :request do
  before(:each) do
    @user = FactoryBot.create(:user_rendering)
    sign_in @user
  end

  describe "GET /test_products" do
    it "returns a 200 status code" do
      get test_products_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /test_products" do
    it "create new product" do
      expect {
        post test_products_path, params: { test_product: FactoryBot.attributes_for(:test_product) }
      }.to change(TestProduct, :count).by(1)
    end
  end

  describe "GET /test_product/:id" do
    it "successfully move on show action" do
      product = FactoryBot.create(:test_product)
      get test_product_path(product)
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /test_product/:id" do
    it "update product" do
      product = FactoryBot.create(:test_product)
      put test_product_path(product), params: { test_product: { product_name: "Fan" } }
      expect(product.reload.product_name).to eq("Fan")
    end
  end

  describe "DELETE /test_product/:id" do
    it "destroys an existing product" do
      product = FactoryBot.create(:test_product)
      expect {
        delete test_product_path(product)
      }.to change(TestProduct, :count).by(-1)
    end
  end
end
