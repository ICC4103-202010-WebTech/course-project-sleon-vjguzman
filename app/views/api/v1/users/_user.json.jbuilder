json.extract! user, :id, :username, :full_name, :short_bio, :location, :password
json.url api_v1_user_url(user, format: :json)