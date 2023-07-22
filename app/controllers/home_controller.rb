class HomeController < ApplicationController
  def index
    @unit = Unit.find(params[:unit_id])
    if params['event_date(1i)'].present? && params['event_date(2i)'].present?
      year = params['event_date(1i)'].to_i
      month = params['event_date(2i)'].to_i
      start_date = Date.new(year, month, 1)
      end_date = start_date.end_of_month
      @event_date = EventDate.where(event_date: start_date..end_date)
    else
      @event_date = EventDate.all
    end
  end
  
end
