HotelAdvisor::Application.routes.draw do

  resources :users, :except => :index
  resources :hotels
  resources :comments
  resources :addresses
  root :to => 'page#index',  :as => 'page'

  resources :sessions, only: [:new, :create, :destroy]

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
end
