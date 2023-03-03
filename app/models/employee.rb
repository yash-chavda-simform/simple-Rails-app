class Employee < ApplicationRecord
  scope :employee_age, -> (age1,age2) { where('age > ?', age1).where('age < ?' ,age2) }
  scope :employee_full_time_availability, -> { where(full_time_available: true) }
  scope :employee_above_age, -> (order,age) { where('no_of_order = ?', order).where('age > ?', age) }
  scope :employee_created_before_today, -> { where('created_at < ?', Date.today) }
  scope :employee_below_age, -> (order,age) { where('no_of_order = ?', order).or(Employee.where('age < ?', age)) }
  scope :employee_descending_on_ages , -> { order(age: :desc) }
  scope :employee_aescending_on_orders , -> { order(:no_of_order) }
  scope :employee_salary , -> (salary) { where('salary > ?', salary) }
  scope :unscope_employee , -> { where('no_of_order = ?',5).limit(2).unscope(:limit) }
  scope :only_employee , -> { where('no_of_order = ?',5).limit(2).only(:limit) }
  scope :reselect_employee , -> { select(:email).where(no_of_order:5).reselect(:first_name, :last_name, :email) }
  scope :reorder_orders_employee , -> { order(:no_of_order).reorder(no_of_order: :desc) }
  scope :no_of_orders_employee , -> { order(:salary).reverse_order }
  scope :order_employee , -> { select("no_of_order").group("no_of_order").order("no_of_order").where("no_of_order > ?", 5) }
end
