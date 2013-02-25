class Resume < ActiveRecord::Base
  belongs_to :user, :dependent => :delete
  belongs_to :job, :dependent => :delete
  
  validates_presence_of :user_id, :job_id
  validates_uniqueness_of :user_id, :scope => :job_id
  
  scope :accepted, where(:accepted => true)
end




# == Schema Information
#
# Table name: resumes
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  job_id     :integer         not null
#  note       :text
#  accepted   :boolean         default(FALSE)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

