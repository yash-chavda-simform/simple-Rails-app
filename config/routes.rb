Rails.application.routes.draw do
  get 'books/index'
  get 'authors/index'
  # get 'products/index'
  root "products#index"
  resources :products
  resources :books
  resources :authors
  #get "/products/:id", to: "products#show"
  # get "/products/:id", to: "products#show"
  #resource :products
  #get "/home", to: "homes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
