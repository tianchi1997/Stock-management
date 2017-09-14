Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :groups
  resources :items
  resources :item_expiries
  resources :locations
  resources :stock_items
  resources :users

  get 'stock_take', to: 'stock_take#index'
  get 'stock_take/locations/:id', to: 'stock_take#locations'

  get 'reports', to: 'reports#index'
  get 'reports/locations/:id', to: 'reports#locations'
  get 'reports/groups/:id', to: 'reports#groups'
  get 'reports/stock_items/:id', to: 'reports#stock_items'

end
