class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :department
      t.date :birth_date
      t.binary :term_and_condition

      t.timestamps
    end
  end
end
