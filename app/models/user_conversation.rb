class UserConversation < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation

  has_many :messages, :through => :conversation

  delegate :subject, :to => :conversation
  delegate :users, :to => :conversation
end
