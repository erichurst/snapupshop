json.array!(@users) do |user|
  json.extract! user, :instagram_username, :email
  json.url user_url(user, format: :json)
end