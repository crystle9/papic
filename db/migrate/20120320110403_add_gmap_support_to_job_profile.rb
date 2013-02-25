class AddGmapSupportToJobProfile < ActiveRecord::Migration
  def change
    add_column :job_profiles, :latitude, :float
    add_column :job_profiles, :longitude, :float
    add_column :job_profiles, :gmaps, :boolean
  end
end
