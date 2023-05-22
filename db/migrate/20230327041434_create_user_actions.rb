class CreateUserActions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_actions do |t|
      t.string :name
      t.string :email
      t.string :profile

      t.timestamps
    end
  end
end
