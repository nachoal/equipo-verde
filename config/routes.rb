Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # Rutas esteticas
  get '/contact', to: 'pages#contact'
  get '/about', to: 'pages#about'
  get '/reviews', to: 'pages#reviews'
  get '/recycle', to: 'pages#recycle'

  # Rutas con interaccion de BD
  resources :categories, only: [:index, :show]
  resources :orders, only: [:new, :create, :show, :update]
end
