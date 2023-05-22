class CreateTestProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :test_products do |t|
      t.string :product_name
      t.decimal :price
      t.string :description

      t.timestamps
    end
  end
end
