class DropCustomerRouter < ActiveRecord::Migration[7.0]
  def change
    drop_table :customer_routers
  end
end
