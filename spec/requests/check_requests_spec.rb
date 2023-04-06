require 'rails_helper'
Devise::Test::IntegrationHelpers
RSpec.describe "CheckRequests", type: :request do
  user = UserRendering.first
  product = user.test_products.create(product_name: "Led", price: 45000, description: "led")
  describe "GET /index" do
    it "render successfully" do
      get test_products_url
      expect(response).to have_http_status(302)
    end
  end

  describe "GET /show" do
    it "show page" do
      get test_product_url(product)
      expect(response).to have_http_status(302)
    end
  end

  describe "POST /create" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user_rendering]
    end
    @user = UserRendering.create(email: "yash6@gmail.com",password:"123456")
    
    it "create product" do
      sign_in @user 
        # user = UserRendering.create(email: "yash6@gmail.com",password:"123456")
        # test_product_params = { description: "A test product", price: 10.99, user_rendering_id: user.id }
        # valid_attributes = { test_product: test_product_params }
        # post "/test_products", params: valid_attributes
        # # follow_redirect!
        # binding.pry
        # # expect(response).to have_http_status(:ok)
        # expect(response).to render_template("new")
    end
  end
end
