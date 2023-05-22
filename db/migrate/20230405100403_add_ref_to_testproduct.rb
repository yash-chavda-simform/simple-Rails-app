class AddRefToTestproduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :test_products, :user_rendering, null: false, foreign_key: true
  end
end
