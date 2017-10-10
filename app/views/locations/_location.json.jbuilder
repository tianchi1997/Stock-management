json.key_format! camelize: :lower
json.extract! location, :id, :name, :description
json.path do
  json.array! location.path.map(&:name)
end

json.items do
  json.array! location.items
end
