class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string  :name, :null => false, :limit => 20 
      t.decimal :pay, :null => false, :scale => 2
      t.string  :state, :null => false
      t.string  :category
      
      t.timestamps
    end
  end
end
