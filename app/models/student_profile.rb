class StudentProfile < ActiveRecord::Base
  CAMPUS = %w(ZiJinGang YuQuan HuaJiaChi XiXi ZhiJiang)
  
  belongs_to :user_profile, :dependent => :destroy
  
  validates_numericality_of :student_card, :only_integer => true
  validates_presence_of :student_card
  validates_inclusion_of :campus, :in => CAMPUS
end

# == Schema Information
#
# Table name: student_profiles
#
#  id              :integer         not null, primary key
#  student_card    :integer         not null
#  campus          :string(255)
#  grade           :string(255)
#  major           :string(255)
#  hometown        :string(255)
#  user_profile_id :integer         not null
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

