class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.string :name 
      t.string :description 
      t.integer :id_no 
      t.string :notes 
      t.integer :rating 
      t.integer :patient_id 
    end 
  end
end
