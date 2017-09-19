json.extract! stock_item, :id, :name, :description, :supplier, :expires
json.url stock_item_url(stock_item, format: :json)
