class Unit < ApplicationRecord
validates :name, presence: true

belongs_to :user
has_many :messages
has_many :tasks
end
