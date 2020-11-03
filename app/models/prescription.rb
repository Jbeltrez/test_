class Prescription < ActiveRecord::Base 
    # has_many :patient_prescriptions
    # has_many :patients, through: :patient_prescriptions
    belongs_to :patient
end 