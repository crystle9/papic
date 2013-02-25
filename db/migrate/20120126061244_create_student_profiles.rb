class CreateStudentProfiles < ActiveRecord::Migration
  def change
    create_table :student_profiles do |t|
      t.integer :student_card, :null => false
      t.string  :campus
      t.string  :grade
      t.string  :major
      t.string  :hometown
      t.references :user_profile, :null => false
      
      t.timestamps
    end
    add_index :student_profiles, :user_profile_id
  end
end
