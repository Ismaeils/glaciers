class Conversation < ApplicationRecord
  before_create :set_default
  def set_default
    self.messages_count = 0
    self.number = Faker::Number.number(digits: 6)
  end
  belongs_to :inbox, class_name: 'Inbox'
  has_many :messages, class_name: 'Message',foreign_key: 'conversation_id'
end
