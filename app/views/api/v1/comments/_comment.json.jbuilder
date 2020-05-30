json.extract! comment, :id, :message, :created_at, :updated_at, :user_id, :event_id
json.url api_v1_comment_url(comment, format: :json)