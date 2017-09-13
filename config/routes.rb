Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :groups
  resources :items
  resources :item_expiries
  resources :locations
  resources :stock_items
  resources :users
end
