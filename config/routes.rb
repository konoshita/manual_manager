Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'dashboards#index'
    get 'dashboards/show', to: 'dashboards#show'
    get 'dashboards/edit', to: 'dashboards#edit'
    resources :users, only: %i[index show edit update]
    resources :manuals, only: %i[index new show create edit update destroy] do
      resources :sentences, only: %i[create edit update destroy ] 
    end
    resources :categories, only: %i[index new create edit update destroy]
    patch "withdrawal/:id" => "users#withdrawal", as: "withdrawal"
  end
  resources :manuals, only: %i[index show]
  resources :categories, only: :index do
    resources :manuals, only: :index, module: :categories
  end
  root "manuals#index"

end
