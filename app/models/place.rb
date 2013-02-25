class Place < ActiveRecord::Base
  belongs_to :user_profile
  
  USER_ADDRESS_TYPES = %w(home office dormitory)
  
  validates_presence_of :address_type, :address
  validates_inclusion_of :address_type, :in => USER_ADDRESS_TYPES
end

# == Schema Information
#
# Table name: places
#
#  id              :integer         not null, primary key
#  address_type    :string(255)
#  address         :string(255)
#  user_profile_id :integer
#  job_profile_id  :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

