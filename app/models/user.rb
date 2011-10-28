class User < ActiveRecord::Base
  has_many :jobs, :dependent => :destroy
  has_many :messages, :dependent => :destroy

  validates_presence_of :name
  validates_length_of :name, :minimum => 3
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  def messages_received
    Message.received_by_user self
  end
end
