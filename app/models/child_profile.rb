class ChildProfile < ActiveRecord::Base
  SEX = %w(male female)
  
  belongs_to :job
  
  validates_presence_of :subject, :sex
  validates_inclusion_of :sex, :in => SEX
end




# == Schema Information
#
# Table name: child_profiles
#
#  id           :integer         not null, primary key
#  subject      :string(255)     not null
#  sex          :string(255)     not null
#  age          :integer
#  grade        :string(255)
#  introduction :text
#  job_id       :integer         not null
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

