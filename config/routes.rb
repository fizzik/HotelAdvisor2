HotelAdvisor::Application.routes.draw do
  resources :users

  root :to => 'page#index',  :as => 'page'
end
