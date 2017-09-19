json.extract! user, :id, :email, :permission_level
json.url user_url(user, format: :json)
