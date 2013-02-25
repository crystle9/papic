class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :phone_type
      t.integer :phone
      t.references :user_profile, :null => false

      t.timestamps
    end
    add_index :contacts, :user_profile_id
  end
end
