Rails.application.routes.draw do
  get 'top/index'
  root to: "units#index"
  devise_for :users
  resources :units, only: [:index, :show, :new, :create, :edit, :update] do
    resources :home, only: [:index]
  end

  resources :messages, only: [:create, :edit, :update, :destroy]
  resources :tasks, only: [:create, :edit, :update,]

end
