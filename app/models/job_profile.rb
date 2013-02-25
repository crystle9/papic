class JobProfile < ActiveRecord::Base
  SEX = %w(whatever male female)
  CAMPUS = %w(whatever ZiJinGang YuQuan HuaJiaChi XiXi ZhiJiang)
  
  belongs_to :job
  
  validates_presence_of :address, :stop_employ_at, :start_work_at, :amount
  validates_inclusion_of  :sex, :in => SEX
  validates_inclusion_of  :campus, :in => CAMPUS
  
  acts_as_gmappable
  def gmaps4rails_address
    "#{self.address}"
  end
end




# == Schema Information
#
# Table name: job_profiles
#
#  id             :integer         not null, primary key
#  address        :string(255)
#  stop_employ_at :date
#  start_work_at  :date
#  amount         :decimal(, )
#  description    :text
#  sex            :string(255)
#  campus         :string(255)
#  grade          :string(255)
#  major          :string(255)
#  hometown       :string(255)
#  job_id         :integer         not null
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

