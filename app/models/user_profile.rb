class UserProfile < ActiveRecord::Base
  SEX = %w(male female)
  
  belongs_to :user
  belongs_to :job
  has_one :student_profile, :dependent => :delete
  has_one :company_profile, :dependent => :delete
  has_many :contacts, :dependent => :delete_all
  has_many :places,   :dependent => :delete_all
  
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_presence_of :first_name, :family_name, :sex, :email
  validates_associated :user
  validates_inclusion_of :sex, :in => SEX
  
  accepts_nested_attributes_for :student_profile, :company_profile,
    :limit => 1
  accepts_nested_attributes_for :contacts, :places
  attr_accessible :first_name, :family_name, :sex, :email, :introduction, 
    :student_profile_attributes, :company_profile_attributes,
    :contacts_attributes, :places_attributes, :avatar
  attr_accessible :first_name, :family_name, :sex, :email, :introduction, 
    :student_profile_attributes, :company_profile_attributes,
    :contacts_attributes, :places_attributes, :avatar,
    :as => :admin
    
  has_attached_file :avatar, 
                  :styles => { :thumb => "100x100#" }
end



# == Schema Information
#
# Table name: user_profiles
#
#  id           :integer         not null, primary key
#  first_name   :string(255)     not null
#  family_name  :string(255)     not null
#  sex          :string(255)     not null
#  email        :string(255)     not null
#  introduction :text
#  user_id      :integer
#  job_id       :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

