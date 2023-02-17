class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.text :content
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps
    end
  end
end
