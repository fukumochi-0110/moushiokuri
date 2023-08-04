require 'rails_helper'

RSpec.describe Unit, type: :model do
  before do
    @unit = FactoryBot.build(:unit)
  end

  describe 'ユニット・階層の新規登録' do
    context '新規登録できる場合' do
      it "nameと紐づくuserが存在すれば登録できる" do
        expect(@unit).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "name(ユニット名・階層名)が空では登録できない" do
        @unit.name = ''
        @unit.valid?
        expect(@unit.errors.full_messages).to include("Name can't be blank")
      end
      it "unitに紐づくuserがなければ登録できない" do
        @unit.user = nil
        @unit.valid?
        expect(@unit.errors.full_messages).to include("User must exist")
      end
    end
  end
end
