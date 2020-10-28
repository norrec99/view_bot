Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations"}
  root to: 'pages#home'
  

  resources :applications, only: [ :show, :index ] 
  resources :reviews, only: [ :edit, :update, :show ] do
    resources :review_tags, only: [:create]
  end
  get "/search", to: "pages#search"

end
