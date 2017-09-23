Rails.application.routes.draw do
  resources :tests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :items, except: [:index]
  resources :item_expiries, only: [:create, :update, :destroy], constraints: { format: 'json' }
  resources :locations
  resources :stock_items
  resources :users

  get 'locations/:id/stock_take', to: 'stock_take#location', as: 'stock_take'
  get 'locations/:id/report', to: 'reports#location', as: 'location_report'
  get 'stock_items/:id/report', to: 'reports#stock_item', as: 'stock_item_report'

  root to: 'locations#index'
end
