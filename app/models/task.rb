class Task < ApplicationRecord
  validates :text, :name, :due_date, presence: true
  validates :completed, inclusion: { in: [true, false] }

  belongs_to :unit
  belongs_to :event_date
end
