class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.references :sender
      t.references :receiver
      t.text       :content
      t.string     :state
    end
    add_index :letters, :sender_id
    add_index :letters, :receiver_id
  end
end
