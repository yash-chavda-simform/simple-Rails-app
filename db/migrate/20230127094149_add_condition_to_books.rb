class AddConditionToBooks < ActiveRecord::Migration[7.0]
  def up
    # add_column :books, :condition, :string
  end
  def down
    remove_column :books, :condition, :string
  end
end
