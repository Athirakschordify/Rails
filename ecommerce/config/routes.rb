Rails.application.routes.draw do
  devise_for :customers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'product#index'
  #root "product#index"
  #get "product/index"
  resources :product
  resources :sale
  

end
