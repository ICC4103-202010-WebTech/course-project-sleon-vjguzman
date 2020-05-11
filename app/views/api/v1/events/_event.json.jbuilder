json.extract! event, :id, :message, :created_at, :updated_at, :choice_of_date, :privacy, :organization
json.url api_v1_event_url(event, format: :json)