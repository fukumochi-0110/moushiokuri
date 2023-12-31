class UnitsController < ApplicationController
  before_action :check_ownership, only: [:edit]

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
    @unit = Unit.find(params[:id])
  end

  def edit
    @unit = Unit.find(params[:id])
  end

   def update
    unit = Unit.find(params[:id])
    if unit.update(unit_params)
      redirect_to units_path
    else
      render :edit
    end
   end

  private

  def unit_params
    params.require(:unit).permit(:name).merge(user_id: current_user.id)
  end

  def check_ownership
    unit = Unit.find(params[:id])
    if current_user.id != unit.user_id
      redirect_to root_path
    end
  end
  
end
