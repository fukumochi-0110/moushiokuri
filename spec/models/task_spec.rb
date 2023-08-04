require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @task = FactoryBot.build(:task)
  end
  describe 'タスクの作成' do
    context 'タスクが投稿できる場合' do
      it 'テキスト、投稿者、期限、紐づく日付とユニット・階層が揃って投稿できる' do
        expect(@task).to be_valid
      end
    end
    context 'タスクが投稿できない場合' do
      it 'textが空では投稿できない' do
        @task.text = ''
        @task.valid?
        expect(@task.errors.full_messages).to include("Text can't be blank")
      end
      it 'name(投稿者)が空では投稿できない' do
        @task.name = ''
        @task.valid?
        expect(@task.errors.full_messages).to include("Name can't be blank")
      end
      it 'due_date(期限)が空では投稿できない' do
        @task.due_date = ''
        @task.valid?
        expect(@task.errors.full_messages).to include("Due date can't be blank")
      end
      it 'completedが空では投稿できない' do
        @task.completed = ''
        @task.valid?
        expect(@task.errors.full_messages).to include("Completed is not included in the list")
      end
      it '日付が紐づいてなければ投稿できない' do
        @task.event_date = nil
        @task.valid?
        expect(@task.errors.full_messages).to include("Event date must exist")
      end
      it 'ユニット・階層が紐付いていなければ投稿できない' do
        @task.unit = nil
        @task.valid?
        expect(@task.errors.full_messages).to include("Unit must exist")
      end
    end
  end
end
