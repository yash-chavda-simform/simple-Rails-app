class ChangeColmnname < ActiveRecord::Migration[7.0]
  def up
    rename_column :authors,:dob,:date_of_birth
  end
  def down
    rename_column :authors,:date_of_birth,:dob
  end
end
