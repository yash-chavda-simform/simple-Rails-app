Rails.application.routes.draw do
  get 'demo/index'
  # get 'events/index'
  # get 'events/show'
  # get 'events/new'
  # get 'events/edit'
  get 'users/signup', to: 'users#new'
  get 'sessions/logout', to: "sessions#logout"
  get 'sessions/profile', to: "sessions#profile"
  get 'sessions/userOptions', to: "sessions#user_options"
  get '/comments/like/:id', to: 'comments#like'
  get '/comments/unlike/:id', to: 'comments#unlike'
  get '/comments/add/:id', to: 'comments#add'
  post 'events/filter', to: 'events#filter'
  root "products#index"
  resources :products
  resources :books
  resources :authors
  resources :faculties
  resources :students
  resources :events
  resources :users
  resources :sessions
  resources :users_events
  resources :comments
  #get "/products/:id", to: "products#show"
  # get "/products/:id", to: "products#show"
  #resource :products
  #get "/home", to: "homes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
