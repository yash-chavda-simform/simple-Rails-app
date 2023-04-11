class CreateEmployeeActions < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_actions do |t|
      t.string :employee_name
      t.string :email
      t.string :password_digest
      t.string :gender
      t.string :address
      t.string :mobile_number
      t.date :birth_date
      t.boolean :hobbies
      t.string :file

      t.timestamps
    end
  end
end
