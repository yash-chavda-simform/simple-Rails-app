class Product < ApplicationRecord
  #basic validation
  validates :name,presence:true
  # validates :name,uniqueness:true

  #callback
  after_save :print_massage

  def print_massage
      puts "Saved Records"
  end
end
