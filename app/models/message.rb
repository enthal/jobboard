class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :job
  
  validates_presence_of :body
  validates_length_of :body, :minimum => 10
end
