class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :job
  
  validates_presence_of :body
  validates_length_of :body, :minimum => 1
  
  scope :received_by_user, lambda { |user|
    joins(:job).
    where('jobs.user_id' => user).
    order('messages.created_at desc')
  }
end
