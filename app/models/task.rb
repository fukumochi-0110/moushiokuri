class Task < ApplicationRecord
  validates :text, presence: { message: 'タスクを入力してください' }
  validates :name, presence: { message: '名前を入力してください' }
  validates :due_date, presence: { message: '期限を入力してください' }
  validates :completed, inclusion: { in: [true, false] }

  belongs_to :unit
  belongs_to :event_date
end
