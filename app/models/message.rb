class Message < ApplicationRecord
  validates :text, presence: { message: '申し送りを入力してください' }
  validates :name, presence: { message: '名前を入力してください' }

  belongs_to :unit
  belongs_to :event_date
  has_one_attached :image
end
