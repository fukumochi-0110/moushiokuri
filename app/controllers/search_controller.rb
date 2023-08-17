class SearchController < ApplicationController
  def index
    # このクエリでは、ログイン中のユーザーに関連するUnitのidを先に取得し、
    # それを使ってMessageを検索しています。このように、必要な条件を正しく設定することで、適切なデータだけを検索対象にすることができます。
    user_units = Unit.where(user_id: current_user.id).pluck(:id)
    if params[:q].present?
      @messages_search = Message.where(unit_id: user_units).ransack(name_or_text_cont: params[:q]).result
      @tasks_search = Task.where(unit_id: user_units).ransack(name_or_text_cont: params[:q]).result
      render json:{ messages_search: @messages_search, tasks_search: @tasks_search }

    else
      @messages_search = []
      @tasks_search = []
    end
    # 非同期通信導入まで封印する！！！！！！！！
    # 取り合えずseach/indexでしっかり機能を実装しよう！！！！！！！！
    # 導入できたら解放する！！！！！！！！！！！
    # render 'home/index'
    # 以下home controllerに記述する
    # unit_id = params[:unit_id]
    # @messages = Message.where(unit_id: unit_id)
  end
end
