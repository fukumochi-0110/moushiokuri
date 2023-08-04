class Message < ApplicationRecord
  validates :text, presence: true
  validates :name, presence: true

  belongs_to :unit
  belongs_to :event_date
  has_one_attached :image
end
