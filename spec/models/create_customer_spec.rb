require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "validations" do
    it "is valid with all field" do
      customer = build(:customer)
      expect(customer).to be_valid
    end

    it "not valid without email" do
      customer = build(:customer)
      customer.email = nil
      customer.valid?
      expect(customer.errors[:email]).to include("can't be blank")
    end

    it "is invalid with a duplicate email address" do
      customer = create(:customer)
      customer = build(:customer)
      customer.valid?
      expect(customer.errors[:email]).to include("has already been taken")
    end
  end
end
