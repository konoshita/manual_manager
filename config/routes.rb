Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'dashboards#index'
    resources :users, only: %i[index show edit update]
    resources :manuals, only: %i[index new show create edit update destroy]
    resources :categories, only: %i[index new create edit update destroy]
    patch "withdrawal/:id" => "users#withdrawal", as: "withdrawal"
  end
  resources :manuals, only: %i[index new show]
  resources :categories, only: :index do
    resources :manuals, only: :index, module: :categories
  end
  root "manuals#index"

end
