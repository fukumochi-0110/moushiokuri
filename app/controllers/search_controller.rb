class SearchController < ApplicationController
  def index
    user_units = Unit.where(user_id: current_user.id).pluck(:id)
    if params[:q].present?
      @messages_search = Message.where(unit_id: user_units).ransack(name_or_text_cont: params[:q]).result
      render json:{ messages_search: @messages_search }

    else
      @messages_search = []
      @tasks_search = []
    end
  end
end
