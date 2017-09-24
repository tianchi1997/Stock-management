json.key_format! camelize: :lower
json.array! locations do |location|
  json.text location.name
  json.href location_url(location)
  if !location.locations.empty?
    json.nodes do
      json.partial! 'locations/tree', locations: location.locations
    end
  end
end
