class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :friendships
  has_many :friends, :through => :friendships, class_name: "User", foreign_key: "friend_id"
  has_many :cellars
  has_many :user_conversations
  has_many :conversations, :through => :user_conversations
  has_many :messages, :through => :conversations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true
end
