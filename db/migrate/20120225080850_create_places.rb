class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :address_type
      t.string :address
      t.references :user_profile, :null => false

      t.timestamps
    end
    add_index :places, :user_profile_id
  end
end
