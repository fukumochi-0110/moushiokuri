class SearchController < ApplicationController
  def index
    @messages_search = Message.ransack(name_or_text_cont: params[:q]).result
    @tasks_search = Task.ransack(name_or_text_cont: params[:q]).result
    
    render 'home/index'
  end
end
