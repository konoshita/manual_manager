Rails.application.routes.draw do
  devise_for :users
  
  get 'users/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "manuals#index"
   resources :manuals, only: %i[index new create edit update destroy]
end
