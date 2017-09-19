json.extract! location, :id, :location_id, :name, :description, :created_at, :updated_at
json.items location.items
json.item_expiries location.item_expiries
json.stock_items location.stock_items
json.url location_url(location, format: :json)
