Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  resources :applications, only: [ :show, :index ] 
  resources :reviews, only: [ :edit, :update, :show ]
  get "/search", to: "pages#search"
end
