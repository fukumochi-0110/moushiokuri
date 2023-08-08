Rails.application.routes.draw do
  root to: "top#index"
  devise_for :users
  resources :units, only: [:index, :new, :create, :edit, :update] do
    resources :home, only: [:index]
  end

  resources :messages, only: [:create, :edit, :update, :destroy]
  resources :tasks, only: [:create, :edit, :update,]

end
