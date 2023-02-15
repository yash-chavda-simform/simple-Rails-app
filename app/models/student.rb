class Student < ApplicationRecord
  validates :last_name, :first_name, :department, presence: true
  validates :birth_date, comparison: {less_than: Date.today, message:"birthdate can't be in future"}
  validates :term_and_condition, acceptance: { message: 'You cannot proceed without accepting Terms of Usage' }
  validates :department, inclusion: { in: %w(IT CE), message:"department can't be %{value}"}
  #callbacks
  before_validation :check_date
  after_validation :validate_email, on: [:create]
  after_destroy :print_message
  before_destroy :print_before

  after_initialize do |student|
    puts "You have initialized an object!"
  end
  
  after_find do |student|
    puts "You have found an object!"
  end

  private
  def check_date
    if birth_date.nil?
      self.birth_date = 01/02/2000
    end
  end
  
  def validate_email
    puts("Email validated")
  end
  
  def print_message
    puts("data is deleted")
  end 

  def print_before
    puts("data is going to deleted")
  end
end
