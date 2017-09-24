json.key_format! camelize: :lower
json.extract! item_expiry, :id, :item_id, :count

if item_expiry.expiry_date != nil
  json.expiry_date item_expiry.expiry_date.strftime("%Y-%m-%d")
end
