json.extract! item, :id, :location_id, :stock_item_id, :required, :order_to, :created_at, :updated_at
json.url item_url(item, format: :json)
