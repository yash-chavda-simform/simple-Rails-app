class AddQueryproductToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :query_product, null: false, foreign_key: true
    add_reference :orders, :customer, null: false, foreign_key: true
  end
end
