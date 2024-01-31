Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  namespace :admin do
    root to: 'dashboards#index'
    get 'dashboards/show', to: 'dashboards#show'
    get 'dashboards/edit', to: 'dashboards#edit'
    resources :users, only: %i[index show edit update]
    resources :manuals, only: %i[index new show create edit update destroy] do
      resources :sentences, only: %i[create edit update destroy ] 
    end
    resources :quizzes, only: %i[index new show create edit update destroy] do
      resources :questions, only: %i[create edit update destroy ] do
        resources :choices, only: %i[create edit update destroy ]
      end
    end
    resources :categories, only: %i[index new create edit update destroy]
    patch "withdrawal/:id" => "users#withdrawal", as: "withdrawal"
  end
  resources :manuals, only: %i[index show]
  resources :categories, only: :index do
    resources :manuals, only: :index, module: :categories
  end
  root "categories#index"

end
