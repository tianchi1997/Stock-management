Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Home page
  root to: 'home#index'
  get 'home/index'

  # Login routing
  devise_for :users

  # Item routes
  resources :items, except: [:index]
  post 'items/:id/save_expiries', to: 'items#save_expiries'

  # Location routes
  resources :locations
  get 'locations/:parent_id/new', to: 'locations#new', as: 'new_sublocation'
  get 'locations/:id/stock_take', to: 'stock_take#location', as: 'stock_take'
  get 'locations/:id/report', to: 'reports#location', as: 'location_report'

  resources :stock_items # Stock item route
  resources :users # User administration route
  get 'report', to: 'reports#location', as: 'report' # Global report route
end
