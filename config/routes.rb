Rails.application.routes.draw do
  get 'stock_take/index'

  get 'stock_take/locations'

  get 'reports/index'

  get 'reports/locations'

  get 'reports/groups'

  get 'reports/stock_items'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :groups
  resources :items
  resources :item_expiries
  resources :locations
  resources :stock_items
  resources :users
end
