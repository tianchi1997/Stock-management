Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get 'home/index'

  devise_for :users

  resources :items, except: [:index]
  resources :locations
  resources :stock_items
  resources :users

  post 'items/:id/save_expiries', to: 'items#save_expiries'

  get 'locations/:id/stock_take', to: 'stock_take#location', as: 'stock_take'
  get 'locations/:id/report', to: 'reports#location', as: 'location_report'
  get 'locations/:parent_id/new', to: 'locations#new', as: 'new_sublocation'
  get 'report', to: 'reports#location', as: 'report'
end
