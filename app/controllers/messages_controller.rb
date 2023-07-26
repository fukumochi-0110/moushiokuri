class MessagesController < ApplicationController
  before_action :same_action, only: [:edit, :update, :destroy]

  def create
    year = Date.today.year
    month = Date.today.month
    start_date = Date.new(year, month, 1)
    end_date = start_date.end_of_month
    @event_date = EventDate.where(event_date: start_date..end_date)

    @unit = Unit.find_by(id: params[:message][:unit_id])
    @message = Message.new(message_params)
    if @message.save
      redirect_to unit_home_index_path(unit_id: @message.unit_id)
    else
      flash[:error] = @message.errors.full_messages
      redirect_to unit_home_index_path(unit_id: @message.unit_id)
    end
  end

  def edit
    
    @unit = @message.unit
  end

  def update
    
    if @message.update(message_params)
      redirect_to unit_home_index_path(unit_id: @message.unit_id)
    else
      render :edit
    end
  end

  def destroy
    
    if @message.destroy
      redirect_to unit_home_index_path(unit_id: @message.unit_id)
    else
      render :index
    end
  end
  
  private

  def message_params
    event_date = EventDate.find_by(event_date: params[:message][:event_date])
    params[:message][:event_date_id] = event_date.id if event_date
    params.require(:message).permit(:text,:name,:unit_id, :event_date_id, :image)
  end

  def same_action
    @message = Message.find(params[:id])
    @unit = @message.unit
  end
end
