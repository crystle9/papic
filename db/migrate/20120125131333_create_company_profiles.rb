class CreateCompanyProfiles < ActiveRecord::Migration
  def change
    create_table :company_profiles do |t|
      t.string :name,            :null => false
      t.references :user_profile, :null => false

      t.timestamps
    end
    add_index :company_profiles, :user_profile_id
  end
end
