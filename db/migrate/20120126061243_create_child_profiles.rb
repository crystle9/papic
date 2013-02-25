class CreateChildProfiles < ActiveRecord::Migration
  def change
    create_table :child_profiles do |t|
      t.string  :subject, :null => false
      t.string  :sex,     :null => false
      t.integer :age
      t.string  :grade
      t.text    :introduction
      t.references :job, :null => false
      
      t.timestamps
    end
    add_index :child_profiles, :job_id
  end
end
