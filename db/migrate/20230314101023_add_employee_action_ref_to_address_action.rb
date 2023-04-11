class AddEmployeeActionRefToAddressAction < ActiveRecord::Migration[7.0]
  def change
    add_reference :address_actions, :employee_action, null: false, foreign_key: true
  end
end
