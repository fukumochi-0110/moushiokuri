class Task < ApplicationRecord
  validates :text, :name, :due_date, :event_date_id, :unit_id, presence: true
  validates :completed, inclusion: { in: [true, false] }

  belongs_to :unit
  belongs_to :event_date
end
