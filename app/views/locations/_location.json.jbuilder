json.extract! location, :id, :location_id, :name, :description
json.items do
  json.array! location.items, partial: 'items/item', as: :item
end
