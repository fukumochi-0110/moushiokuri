Rails.application.routes.draw do
  root to: "units#index"
  devise_for :users
  resources :units, only: [:index, :show, :new, :create] do
    resources :home, only: [:index]
  end
  resources :messages, only: [:create]
end
