class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string  :first_name,   :null => false
      t.string  :family_name,  :null => false
      t.string  :sex,          :null => false
      t.string  :email,        :null => false
      t.text    :introduction
      t.references :user
      t.references :job
      
      t.timestamps
    end
    add_index :user_profiles, :user_id
    add_index :user_profiles, :job_id
  end
end
