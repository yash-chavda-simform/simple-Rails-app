class CreateRailsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :rails_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
