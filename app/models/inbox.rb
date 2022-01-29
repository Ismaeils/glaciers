class Inbox < ApplicationRecord
    before_create :default_values
    def default_values
        self.conversations_count = 0
        self.token = Faker::Crypto.md5
    end

    validates :name, presence: true

    has_many :conversations, class_name: 'Conversation',foreign_key: 'inbox_id'
end
