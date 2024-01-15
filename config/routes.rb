Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'dashboards#index'
    resources :users, only: %i[index show edit update delete]
    resources :manuals, only: %i[index new create edit update destroy]
  end
  resources :manuals, only: %i[index new ]
  root "manuals#index"

end
