Rails.application.routes.draw do

  root "manuals#index"

  devise_for :users

  namespace :admin do
    root to: 'dashboards#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    resources :users, only: %i[index show edit update destroy]
    resources :boards, only: %i[index show edit update destroy]
  end

  resources :manuals, only: %i[index new create edit update destroy]

  get 'users/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
