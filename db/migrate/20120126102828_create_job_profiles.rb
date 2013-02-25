class CreateJobProfiles < ActiveRecord::Migration
  def change
    create_table :job_profiles do |t|
      t.string :address
      t.date   :stop_employ_at
      t.date   :start_work_at
      t.decimal :amount, :scale => 0
      t.text   :description
      #required student profile
      t.string  :sex
      t.string  :campus
      t.string  :grade
      t.string  :major
      t.string  :hometown
 
      t.references :job, :null => false                                                           
      
      t.timestamps
    end
    add_index :job_profiles, :job_id
  end
end
