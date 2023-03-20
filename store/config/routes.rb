Rails.application.routes.draw do
  #devise_for :users
  resources :items
  resources :roles
  #resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'items#index'
  devise_for :users
    scope '/admin' do
    resources :users
  end

end
