require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  let(:customer) { FactoryBot.create(:customer) }

  describe 'GET #index' do
    it 'returns a success response for index' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: customer.id } }

    it 'returns a success response for show' do
      expect(response).to be_successful
    end

    it 'assigns the correct customer' do
      expect(assigns(:customer)).to eq(customer)
    end
  end

  describe 'GET #new' do
    it 'returns a success response for new' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates a new customer' do
      expect {
        post :create, params: { customer: { first_name: customer.first_name, last_name: customer.last_name, email: customer.email } }
      }.to change(Customer,  :count).by(1)
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: customer.id } }

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'assigns the correct edit' do
      expect(assigns(:customer)).to eq(customer)
    end
  end

  describe 'PUT #update' do
    let(:new_attributes) { { name: 'Jane Doe' } }

    before { put :update, params: { id: customer.id, customer: { email: "yash@gmail.com" } } }

    it 'updates the customer' do
      customer.reload
      expect(customer.email).to eq('yash@gmail.com')
    end

    it 'redirects to the customer' do
      expect(response).to redirect_to(customers_url)
    end
  end

  describe 'DELETE #destroy' do
    before { customer }
    it 'destroys the customer' do
      expect {
        delete :destroy, params: { id: customer.id }
      }.to change(Customer, :count).by(-1)
    end

    it 'redirects to the customers list' do
      delete :destroy, params: { id: customer.id }
      expect(response).to redirect_to(customers_url)
    end
  end

end