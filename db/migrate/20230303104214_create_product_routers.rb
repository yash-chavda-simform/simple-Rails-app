class CreateProductRouters < ActiveRecord::Migration[7.0]
  def change
    create_table :product_routers do |t|
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
