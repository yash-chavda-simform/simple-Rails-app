class CreateOrderRouters < ActiveRecord::Migration[7.0]
  def change
    create_table :order_routers do |t|
      t.integer :quantity
      t.references :product_router, null: false, foreign_key: true

      t.timestamps
    end
  end
end
