class AddAttachmentLicenseToCompanyProfile < ActiveRecord::Migration
  def self.up
    add_column :company_profiles, :license_file_name, :string
    add_column :company_profiles, :license_content_type, :string
    add_column :company_profiles, :license_file_size, :integer
    add_column :company_profiles, :license_updated_at, :datetime
  end

  def self.down
    remove_column :company_profiles, :license_file_name
    remove_column :company_profiles, :license_content_type
    remove_column :company_profiles, :license_file_size
    remove_column :company_profiles, :license_updated_at
  end
end
