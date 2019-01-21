Rails.application.routes.draw do

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'products', to: 'products#index'
  get 'products/:id', to: 'products#show'

  put 'products/:id/addtocart', to: 'products#add_to_cart'
  put 'products/:id/removefromcart', to: 'products#remove_from_cart'
  put 'checkout', to: 'carts#checkout'
  get 'carts/current', to: 'carts#show'
  get 'carts/history', to: 'carts#index'

end