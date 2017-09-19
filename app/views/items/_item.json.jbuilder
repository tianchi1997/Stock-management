json.extract! item, :id, :location_id, :stock_item_id, :required, :order_to
json.stock_item do
  json.partial! 'stock_items/stock_item', stock_item: item.stock_item
end
json.item_expiries do
  json.array! item.item_expiries, partial: 'item_expiries/item_expiry', as: :item_expiry
end
