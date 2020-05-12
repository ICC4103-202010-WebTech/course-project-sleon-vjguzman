json.extract! event, :id, :description, :location, :final_date, :creation_date, :created_at, :updated_at
json.url api_v1_event_url(event, format: :json)