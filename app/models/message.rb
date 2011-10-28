class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :job
  
  validates_length_of :body, :minimum => 10
  
  scope :received_by_user, lambda { |user|
    joins(:job).
    where('jobs.user_id' => user).
    order('messages.created_at desc')
  }
end
