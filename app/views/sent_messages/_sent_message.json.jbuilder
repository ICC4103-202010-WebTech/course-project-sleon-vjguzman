json.extract! sent_message, :id, :created_at, :updated_at
json.url sent_message_url(sent_message, format: :json)
