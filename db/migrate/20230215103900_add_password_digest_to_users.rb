class AddPasswordDigestToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password_digest, :string
    remove_column :users, :password, :string
    rename_column :users, :name, :email
  end
end
