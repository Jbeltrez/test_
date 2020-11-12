class Patient < ActiveRecord::Base 
    
    has_many :prescriptions
    #accessible through bcrypt gem
    #makes password not visible no matter what
    has_secure_password
    validates_presence_of :username, :password
    validates :username, uniqueness: true
end