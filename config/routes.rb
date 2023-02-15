Rails.application.routes.draw do
  get 'demo/index'
  get 'events/index'
  get 'events/show'
  get 'events/new'
  get 'events/edit'
  get 'users/signup'  => 'users#new'
  get 'sessions/logout', to: "sessions#logout"
  
  root "products#index"
  resources :products
  resources :books
  resources :authors
  resources :faculties
  resources :students
  resources :events
  resources :users
  resource  :sessions
  #get "/products/:id", to: "products#show"
  # get "/products/:id", to: "products#show"
  #resource :products
  #get "/home", to: "homes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
