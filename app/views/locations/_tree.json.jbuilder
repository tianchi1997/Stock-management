json.array! locations do |location|
  json.text location.name
  json.href location_url(location)
  json.nodes do
    json.partial! 'locations/tree', locations: location.locations
  end
end
