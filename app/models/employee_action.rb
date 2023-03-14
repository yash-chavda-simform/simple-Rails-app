class EmployeeAction < ApplicationRecord
  has_secure_password
  mount_uploader :file, FileUploader
  has_many :address_actions, inverse_of: :employee_action, dependent: :destroy
  accepts_nested_attributes_for :address_actions
end
