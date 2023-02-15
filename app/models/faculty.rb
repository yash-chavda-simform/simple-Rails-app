class Faculty < ApplicationRecord
  PHONE_REGEX = /\A\d{10}\z/
  validates :last_name, :first_name, :email, :designation, :phone_no,  presence: true
  validates :phone_no , format:{ with:PHONE_REGEX}
  validates :email, uniqueness: true
  validates :birth_date, comparison: {less_than: Date.today, message:"birthdate can't be in future"}
  validates :designation, inclusion: { in: %w(Ass.Prof. Prof.), message:"designation can't be %{value}"}, exclusion: { in: %w(HOD Sr.Prof.), message:"designation can't be HOD or Sr.Prof"}
  # validates :designation,  

  #callbacks
  after_validation :set_message,:check_date, on: [ :create, :update]
  after_destroy :confirm_delete
  after_validation :validate_email, on: [:create]

  after_initialize do |faculty|
    puts "You have initialized an object!"
  end
  
  after_find do |faculty|
    puts "You have found an object!"
  end

  private
    def set_message
      puts("Date Of Birth Is valid")
    end
  
    def check_date
      if birth_date.nil?
        self.birth_date = 01/02/2000
      end
    end

    def validate_email
      puts("Email validated")
    end

    def update_record
      puts("record updated")
    end
     
    def confirm_delete
      puts "record is deleted"
    end
end
