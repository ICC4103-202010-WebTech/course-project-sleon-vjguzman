json.extract! event, :id, :message, :created_at, :updated_at, :user, :event
json.url api_v1_event_url(event, format: :json)