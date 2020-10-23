class Patient < ActiveRecord::Base 
    has_many :prescriptions
    has_secure_password
    validates :username, presence: true 
end