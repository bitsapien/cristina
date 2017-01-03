json.extract! conversation, :id, :body, :understood, :created_at, :updated_at
json.url conversation_url(conversation, format: :json)