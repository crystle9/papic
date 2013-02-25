class CompanyProfile < ActiveRecord::Base
  belongs_to :user_profile
  
  validates_presence_of :name
  
  has_attached_file :license,
    :styles => {:normal => "424x300#", :thumb => "141x100#"}
  validates_attachment_content_type :license, 
    :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_size :license, :less_than => 2.megabyte
  
  attr_accessible :name, :license
end

# == Schema Information
#
# Table name: company_profiles
#
#  id                   :integer         not null, primary key
#  name                 :string(255)     not null
#  user_profile_id      :integer         not null
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#  license_file_name    :string(255)
#  license_content_type :string(255)
#  license_file_size    :integer
#  license_updated_at   :datetime
#

