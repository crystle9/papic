class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # authlogic setup
      t.string :login,              :null => false
      t.string :persistence_token,  :null => false
      t.string :crypted_password,   :null => false
      t.string :password_salt,      :null => false
      t.string :single_access_token,:null => false
      t.string :role,               :null => false
      t.boolean :is_frozen,         :null => false
      t.timestamps
    end
  end
end
