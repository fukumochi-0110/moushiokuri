class MessagesController < ApplicationController
  before_action :same_action, only: [:edit, :update, :destroy, :message_ownership]
  before_action :message_ownership, only: [:edit, :update, :delete]

  def create
    @unit = Unit.find_by(id: params[:message][:unit_id])
    @message = Message.new(message_params)
    if @message.save
      redirect_to unit_home_index_path(unit_id: @message.unit_id)
    else
      flash[:message_error] = @message.errors.full_messages
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

  def message_ownership

    
    if @unit && @unit.user_id != current_user.id
      redirect_to units_path(@unit)
    end
  end
end

