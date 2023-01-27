class AddAgeToAuthors < ActiveRecord::Migration[7.0]
  def up
    add_column :authors, :age, :integer
  end
end
