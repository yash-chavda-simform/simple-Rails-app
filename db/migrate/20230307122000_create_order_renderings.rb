class CreateOrderRenderings < ActiveRecord::Migration[7.0]
  def change
    create_table :order_renderings do |t|
      t.integer :quantity
      t.references :product_rendering, null: false, foreign_key: true

      t.timestamps
    end
  end
end
