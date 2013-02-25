class User < ActiveRecord::Base
  ROLES = %w(student parent company guest admin)
  
  has_many :resumes
  has_many :jobs, :through => :resumes
  has_one  :user_profile, :dependent => :delete
  has_many :user_resumes
  has_many :letters
  
  
  attr_accessible :login, :password, :password_confirmation, :agreement
  accepts_nested_attributes_for :resumes
  
  validates_confirmation_of :password
  validates_inclusion_of :role, :in => ROLES
  validates_acceptance_of :agreement, :on => :create
    
  # AuthLogic Configs
  acts_as_authentic do |config|
    # config.crypto_provider = Authlogic::CryptoProviders::MD5
    config.logged_in_timeout = 20.minutes
    config.validate_email_field = false
  end
  
  def is_admin?
    self.role == 'admin'
  end
  
  def have_checker_permission_for(job)
    (!job.user_profile.user && self.is_admin?) || 
    (self == job.user_profile.user)
  end
  
  def can_create_job_for?(category)
    return true  if self.is_admin?
    return false if self.is_frozen
    role = self.role
    case category
    when 'campus'  then role != 'parent' && role != 'company'
    when 'tutor'   then role != 'company'
    when 'parttimes' then role == 'company'
    else false
    end
  end
  
  def can_create_valid_job_for?(category)
    return true if self.is_admin?
    return false if self.is_frozen
    role = self.role
    case category
    when 'campus'    then role == 'student'
    when 'tutor'     then role == 'parent'
    when 'parttimes' then role == 'company'
    else false
    end
  end
end


# == Schema Information
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  login               :string(255)     not null
#  persistence_token   :string(255)     not null
#  crypted_password    :string(255)     not null
#  password_salt       :string(255)     not null
#  single_access_token :string(255)     not null
#  role                :string(255)     not null
#  is_frozen           :boolean         not null
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#

