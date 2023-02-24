class CreateQueryProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :query_products do |t|
      t.string :title
      t.string :description
      t.decimal :price
      t.integer :capacity
      t.boolean :is_active
      t.integer :status

      t.timestamps
    end
  end
end
