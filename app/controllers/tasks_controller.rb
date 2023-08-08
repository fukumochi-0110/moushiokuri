class TasksController < ApplicationController
  before_action :task_ownership,only: [:edit, :update]
  
  def create
    @unit = Unit.find_by(id: params[:task][:unit_id])
    @task = Task.new(task_params)
    
    if @task.save
      redirect_to unit_home_index_path(unit_id: @task.unit_id)
    else
      flash[:task_error] = @task.errors.full_messages
      redirect_to unit_home_index_path(unit_id: @task.unit_id)
    end
  end

  def edit
    today = Date.today 
    @today_date = EventDate.find_by(event_date: today)
    @task = Task.find(params[:id])
    @unit = @task.unit
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      if params[:is_ajax] == 'true'
        render json: { task: @task }
      else
        redirect_to unit_home_index_path(unit_id: @task.unit_id)
      end
    else
      render :edit
    end
  end

  private
  def task_params
    event_date = EventDate.find_by(event_date: params[:task][:event_date])
    params[:task][:event_date_id] = event_date.id if event_date
    params[:task][:completed] = params[:task][:completed] == '1'
    params.require(:task).permit(:text,:name,:unit_id, :event_date_id, :due_date, :completed)
  end

  def task_ownership
    @task = Task.find(params[:id])
    @unit = @task.unit
    
    if @unit && @unit.user_id != current_user.id
      redirect_to units_path(@unit)
    end
  end
end
