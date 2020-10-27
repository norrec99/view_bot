Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  resources :applications, only: [ :show ] 
  resources :reviews, only: [ :edit, :update, :show ]
end
