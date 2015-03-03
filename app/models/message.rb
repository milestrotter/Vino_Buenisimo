class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation

  attr_accessor :subject
end
