Rails.application.routes.draw do
  resources :products

  resources :carts do
    resources :products
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

end