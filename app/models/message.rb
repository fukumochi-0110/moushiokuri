class Message < ApplicationRecord
  validates :text, presence: true
  validates :name, presence: true
  validates :event_date_id , presence: true
  validates :unit_id , presence: true

  belongs_to :unit
  belongs_to :event_date
  has_one_attached :image
end
