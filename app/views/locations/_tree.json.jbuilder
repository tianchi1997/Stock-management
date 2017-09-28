json.key_format! camelize: :lower

json.array! locations_tree do |location, subtree|
  json.text location.name
  json.href location_url(location)
  if subtree.is_a?(Hash) && !subtree.empty?
    json.nodes do
      json.partial! 'locations/tree', locations_tree: subtree
    end
  end
end
