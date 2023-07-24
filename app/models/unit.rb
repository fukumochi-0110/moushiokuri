class Unit < ApplicationRecord
validates :name, presence: true
validates :user_id, presence: true

belongs_to :user
has_many :messages
has_many :tasks
end
