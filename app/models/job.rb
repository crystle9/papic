class Job < ActiveRecord::Base
  STATES = %w(invalid valid old)
  CATEGORIES = %w(tutor campus parttimes)
  
  has_many :resumes
  has_many :users, :through => :resumes
  has_one  :job_profile
  has_one  :user_profile
  has_one  :child_profile, :dependent => :delete
  
  validates_presence_of :name, :pay, :state, :category, 
    :job_profile, :user_profile
  validates_numericality_of :pay, :greater_than_or_equal_to => 0
  validates_inclusion_of :state, :in => STATES
  validates_inclusion_of :category,  :in => CATEGORIES
  
  accepts_nested_attributes_for :resumes
  accepts_nested_attributes_for :job_profile, :child_profile, :user_profile,
    :limit => 1
  
  attr_accessible :name, :pay, :category,
    :job_profile_attributes, :child_profile_attributes, :resumes_attributes
  attr_accessible :name, :pay, :category,
    :job_profile_attributes, :child_profile_attributes, :user_profile_attributes,
    :resumes_attributes, :as => :admin
  
  default_scope order('updated_at desc')
  scope :campus, where(:category => 'campus')
  scope :tutor, where(:category => 'tutor')
  scope :parttimes, where(:category => 'parttimes')
  scope :invalid, where(:state => 'invalid')
  scope :valid, where(:state => 'valid')
  scope :old, where(:state => 'old')
end




# == Schema Information
#
# Table name: jobs
#
#  id         :integer         not null, primary key
#  name       :string(20)      not null
#  pay        :decimal(, )     not null
#  state      :string(255)     not null
#  category   :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

