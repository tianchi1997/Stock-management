json.key_format! camelize: :lower
json.extract! location, :id, :name, :description
json.items do
  json.array! location.items
end
