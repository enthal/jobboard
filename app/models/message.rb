class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :job
  
  validates_length_of :body, :minimum => 10
  
  def self.received_by_user user
    joins(:job).
    where('jobs.user_id' => user).
    order('messages.created_at desc')
  end
end
