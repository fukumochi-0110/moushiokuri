class UnitsController < ApplicationController
  

  def index
    @units = Unit.where(user_id: current_user.id)
  end

  def new
   @unit = Unit.new
  end

  def create
    @unit = Unit.new(unit_params)

    if @unit.save
      redirect_to units_path
    else
      render :new
    end
  end

  def show
  end

  private

  def unit_params
    params.require(:unit).permit(:name).merge(user_id: current_user.id)
  end
  
end
