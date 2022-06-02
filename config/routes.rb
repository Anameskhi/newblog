Rails.application.routes.draw do
  root "articles#index"


  resources :articles do
    resources :comments

 end
#  resources :posts
#  resources :users, only: [:create]
 get '/register', to: 'users#new', as: :user_register

 put '/save_user', to:'users#create', as: :save_user

 get "/users", to: 'users#index'

 get '/signin', to: 'users#signin', as: :signin_user

 post '/login', to:'users#login', as: :login_user

 get '/logout', to:'users#log_out'


end
