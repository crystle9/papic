class Letter < ActiveRecord::Base
  STATES = %w(valid old)
  
  belongs_to :receiver, :class_name => 'User'
  belongs_to :sender,   :class_name => 'User'
  
  attr_accessible :content
  
  validates_presence_of :sender_id, :receiver_id, :content
  validates_numericality_of :sender_id, :receiver_id
  validates_inclusion_of :state, :in => STATES
  
  scope :with_receiver, lambda {|id| where(:receiver_id => id).limit(20)}
end


# == Schema Information
#
# Table name: letters
#
#  id          :integer         not null, primary key
#  sender_id   :integer
#  receiver_id :integer
#  content     :text
#  state       :string(255)
#

