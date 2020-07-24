class Author < ActiveRecord::Base
  
    # phonenumber == 10 digits/ also numerically
    validates :name, :phone_number, presence: true, uniqueness: true
    validates :phone_number, numericality:{only_integer: true}, length: {is: 10}

end
