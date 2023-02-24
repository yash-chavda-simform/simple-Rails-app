Rails.application.routes.draw do
  get 'demo/index'
  get 'users/signup', to: 'users#new'
  get 'sessions/logout', to: "sessions#logout"
  get 'sessions/profile', to: "sessions#profile"
  get '/comments/like/:id', to: 'comments#like'
  get '/comments/unlike/:id', to: 'comments#unlike'
  get '/comments/add/:id', to: 'comments#add'
  post '/events/filter', to: 'events#filter'
  post '/employees/verify_email', to: 'employees#verify_email'
  get 'employees/employees_result', to: 'employees#employees_result'
  get 'employees/increase', to: 'employees#increase'
  get 'employees/decrease', to: 'employees#decrease'
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
  resources :employees
  resources :customers
  resources :orders
  resources :query_products
  #get "/products/:id", to: "products#show"
  # get "/products/:id", to: "products#show"
  #resource :products
  #get "/home", to: "homes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
