require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end
  describe '申し送りの作成' do
    context '申し送りが投稿できる場合' do
      it '画像とテキスト、投稿者、紐づく日付とユニット・階層が揃って投稿できる' do
        expect(@message).to be_valid
      end
      it 'テキストのみで投稿できる' do
        @message.image = nil
        expect(@message).to be_valid
      end
    end
    context '申し送りが投稿できない場合' do
      it 'textが空では投稿できない' do
        @message.text = ''
        @message.valid?
        expect(@message.errors.full_messages).to include("Text can't be blank")
      end
      it 'name(投稿者)が空では投稿できない' do
        @message.name = ''
        @message.valid?
        expect(@message.errors.full_messages).to include("Name can't be blank")
      end
      it '日付が紐づいてなければ投稿できない' do
        @message.event_date = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Event date must exist")
      end
      it 'ユニット・階層が紐付いていなければ投稿できない' do
        @message.unit = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Unit must exist")
      end
    end
  end
end
