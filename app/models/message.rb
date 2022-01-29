require 'elasticsearch/model'

class Message < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  before_create :default_values
  def default_values
    self.number = Faker::Number.number(digits: 6)
  end
  belongs_to :conversation, class_name: 'Conversation'
end
