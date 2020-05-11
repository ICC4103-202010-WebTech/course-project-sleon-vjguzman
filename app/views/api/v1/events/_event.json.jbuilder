json.extract! event, :id, :description, :location, :final_date, :creation_date, :created_at, :updated_at, :choice_of_date, :privacy, :organization
json.url api_v1_event_url(event, format: :json)