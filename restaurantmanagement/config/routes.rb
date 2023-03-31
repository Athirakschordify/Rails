Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  # get '/*a', to: 'application#not_found'   

  namespace :api do 
    namespace :v1 do
     resources :restaurantmanagements
     resources :foods
     resources :foodrestaurants
     resources :carts
     get '/user_cart', to: 'carts#user_cart'
     resources :cartdetails
     resources :orders
     resources :orderdetails
     resources :showcarts

    end 
  end 
  

end
