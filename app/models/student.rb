class Student < ApplicationRecord
  validates :last_name, :first_name, :birth_date, presence: {message:"must required"}
  validates :birth_date, comparison: {less_than: Date.today, message:"birthdate can't be in future"}
  validates :term_and_condition, acceptance: { message: 'You cannot proceed without accepting Terms of Usage' }
  validates :department, inclusion: { in: %w(IT CE), message:"department can't be %{value}"}
end
