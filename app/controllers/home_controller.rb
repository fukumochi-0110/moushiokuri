class HomeController < ApplicationController
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
    today = Date.today 
    today_date = EventDate.find_by(event_date: today)
    @messages = Message.where(event_date_id: today_date.id, unit_id: params[:unit_id])
  end

  
end
