json.key_format! camelize: :lower
json.array! locations do |location|
  json.text location.name
  json.href location_url(location)
  if !location.children.empty?
    json.nodes do
      json.partial! 'locations/tree', locations: location.children
    end
  end
end
