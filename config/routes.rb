Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :items
  resources :item_expiries, only: [:create, :update, :destroy], constraints: { format: 'json' }
  resources :locations
  resources :stock_items
  resources :users

  get 'stock_take', to: 'stock_take#index'
  get 'stock_take/locations/:id', to: 'stock_take#locations'

  get 'reports', to: 'reports#index'
  get 'reports/locations/:id', to: 'reports#locations'
  get 'reports/stock_items/:id', to: 'reports#stock_items'

  root to: 'locations#index'
end
