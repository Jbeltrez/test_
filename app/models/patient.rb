class Patient < ActiveRecord::Base 
    # has_many :patient_prescriptions
    # has_many :prescriptions, through: :patient_prescriptions
    has_many :prescriptions
    has_secure_password
    validates :username, :presence => true 
    #validates :username, :uniqueness of?
end