class Faculty < ApplicationRecord
  PHONE_REGEX = /\A\d{10}\z/
  validates :last_name, :first_name, :birth_date, :email, :designation, presence: true
  # validates :phone_no , length:{ is:10 }
  validates :phone_no , format:{ with:PHONE_REGEX}
  validates :email, uniqueness: true
  validates :birth_date, comparison: {less_than: Date.today, message:"birthdate can't be in future"}
  validates :designation, inclusion: { in: %w(Ass.Prof. Prof.), message:"designation can't be %{value}"}, exclusion: { in: %w(HOD Sr.Prof.), message:"designation can't be HOD or Sr.Prof"}
  # validates :designation,  
end
