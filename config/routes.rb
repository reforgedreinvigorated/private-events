Rails.application.routes.draw do
  devise_for :users
  resources :events, only: [:new, :create, :index, :show]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "events#index"
end
