class Patient < ActiveRecord::Base 
    
    has_many :prescriptions
    has_secure_password
    validates_presence_of :username, :password
    validates :username, uniqueness: true
end