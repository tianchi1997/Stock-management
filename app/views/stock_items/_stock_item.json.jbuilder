json.extract! stock_item, :id, :name, :description, :supplier, :expires, :created_at, :updated_at
json.url stock_item_url(stock_item, format: :json)
