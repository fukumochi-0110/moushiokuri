class EventDate < ApplicationRecord
  has_many :messages
  has_many :tasks
end
