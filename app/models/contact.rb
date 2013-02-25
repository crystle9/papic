class Contact < ActiveRecord::Base
  belongs_to :user_profile
  
  PHONE_TYPES = %w(home mobile short_mobile office fax qq)
  
  validates_presence_of :phone_type, :phone, :user_profile
  validates_numericality_of :phone
  validates_inclusion_of :phone_type, :in => PHONE_TYPES
end

# == Schema Information
#
# Table name: contacts
#
#  id              :integer         not null, primary key
#  phone_type      :string(255)
#  phone           :integer
#  user_profile_id :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

