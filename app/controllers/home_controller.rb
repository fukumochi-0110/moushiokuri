class HomeController < ApplicationController
  before_action :unit_same_user

  def index
    # 階層に結びつくhomeを表示する
    @unit = Unit.find_by(id: params[:unit_id])
    if @unit == nil
      # redirect_to LPページ and return
    end
    
    # 日付機能
    if params['event_date(1i)'].present? && params['event_date(2i)'].present?
      year = params['event_date(1i)'].to_i
      month = params['event_date(2i)'].to_i
    else
      year = Date.today.year
      month = Date.today.month
    end
    start_date = Date.new(year, month, 1)
    end_date = start_date.end_of_month
    @event_date = EventDate.where(event_date: start_date..end_date)

    # 申し送り機能
    @message = Message.new
    today = Date.today 
    today_date = EventDate.find_by(event_date: today)
    @messages = Message.where(event_date_id: today_date.id, unit_id: params[:unit_id])
  end

  private
  def unit_same_user
    unit = Unit.find(params[:unit_id])
    unless current_user.id == unit.user_id
      redirect_to root_path
    end
  end
end
