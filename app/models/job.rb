class Job < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :title
  validates_length_of :title, :minimum => 3
  validates_presence_of :company
  validates_length_of :company, :minimum => 2
  validates_presence_of :description
  validates_length_of :description, :minimum => 10
end
