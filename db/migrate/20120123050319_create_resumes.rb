class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.references :user,  :null => false
      t.references :job,   :null => false
      t.text :note
      t.boolean :accepted, :default => false

      t.timestamps
    end
    add_index :resumes, :user_id
    add_index :resumes, :job_id
  end
end
