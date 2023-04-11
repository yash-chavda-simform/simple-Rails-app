Rails.application.routes.draw do
  devise_for :user_renderings
  get 'demo/index'
  get 'query_products/scoped', to: 'query_products#scoped'
  get 'users/signup', to: 'users#new'
  get 'users/signup', to: 'users#new'
  get 'orders/result', to: 'orders#query_result'
  get 'sessions/logout', to: 'sessions#logout'
  get 'sessions/profile', to: 'sessions#profile'
  get '/comments/like/:id', to: 'comments#like'
  get '/comments/unlike/:id', to: 'comments#unlike'
  get '/comments/add/:id', to: 'comments#add'
  post '/events/filter', to: 'events#filter'
  post '/employees/verify_email', to: 'employees#verify_email'
  get 'employees/employees_result', to: 'employees#employees_result'
  get 'employees/increase', to: 'employees#increase'
  get 'employees/decrease', to: 'employees#decrease'
  post 'events/filter', to: 'events#filter'
  get 'cars/search', to: 'cars#search'
  #login and signup action controller
  get 'new_users', to: 'new_users#index'
  get 'new_users/logout', to: 'new_users#logout'
  get 'new_users/signup', to: 'new_users#new'
  post 'new_users/signup', to: 'new_users#create'
  get 'new_users/login', to: 'new_users#login'
  post 'new_users/login', to: 'new_users#authenticate'
  get 'order_renderings', to: 'order_renderings#index'
  root "product_renderings#index"
  get 'employee/search', to: 'employee_actions#search'
  resources :products
  resources :books
  resources :authors
  resources :faculties
  resources :students
  resources :events
  resources :users
  # resources :sessions
  resources :users_events
  resources :comments
  resources :employees
  resources :customers
  resources :orders
  resources :query_products
  resources :cars
  

  resources :product_routers do
    resources :order_routers
  end
  namespace :business do
    resources :customer_routers, only: [:index,:new,:create,:edit,:update] do
      member do
        get 'preview'
        get 'delete_customer'
      end
      collection do
        get 'search'
      end
    end
  end

  namespace :api do
    resource :v1
  end

  resources :product_renderings
  resources :employee_actions
  #get "/products/:id", to: "products#show"
  # get "/products/:id", to: "products#show"
  #resource :products
  #get "/home", to: "homes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
