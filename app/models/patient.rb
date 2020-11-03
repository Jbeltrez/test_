class Patient < ActiveRecord::Base 
    # has_many :patient_prescriptions
    # has_many :prescriptions, through: :patient_prescriptions
    has_many :prescriptions
    has_secure_password
    validates :name, :presence => true 
end