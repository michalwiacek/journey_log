Rails.application.routes.draw do
  resources :trips
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "weathers#index"
  resources :weathers
end
