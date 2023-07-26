class MessagesController < ApplicationController
  def create
    year = Date.today.year
    month = Date.today.month
    start_date = Date.new(year, month, 1)
    end_date = start_date.end_of_month
    @event_date = EventDate.where(event_date: start_date..end_date)

    @unit = Unit.find_by(id: params[:message][:unit_id])
    @message = Message.new(message_params)
    if @message.save
      redirect_to unit_home_index_path(@unit)
    else
      flash[:error] = @message.errors.full_messages
      redirect_to unit_home_index_path(@unit)
    end
  end

  def edit
    @message = Message.find(params[:id])
    @unit = @message.unit
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to unit_home_index_path(unit_id: @message.unit_id)
    else
      render :edit
    end
  end
  
  private
  def message_params
    event_date = EventDate.find_by(event_date: params[:message][:event_date])
    params[:message][:event_date_id] = event_date.id if event_date
    params.require(:message).permit(:text,:name,:unit_id, :event_date_id, :image)
  end
end
